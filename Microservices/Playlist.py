#README

#Playlist Methods

#To create a playlist use the URL POST http://127.0.0.1:5000/recources/playlists
#Arguments - in json format - playlist_title:newPlaylistTitle, URL_list:newURLList, username:newUsername, description:newDescription (description not required)

#To retrieve a playlist use use URL GET http://127.0.0.1:5000/recources/playlists/<int:id>
#Arguments - in URL - an integer representing the ID of a given playlist

#To Delete a Track use URL DELETE http://127.0.0.1:5000/recources/playlists/<int:id>
#Arguments - in URL - an integer representing the ID of a given playlist

#To retrieve all playlists use URL GET http://127.0.0.1:5000/recources/playlists/all
#Arguments - none

#To retrieve all playlists of a given user use URL GET http://127.0.0.1:5000/recources/playlists/<string:username>
#Arguments - in URL - username

import flask_api
from flask import request
from flask import jsonify
from flask_api import exceptions, status
import pugsql

app = flask_api.FlaskAPI(__name__)
app.config["DEBUG"] = True
app.config.from_envvar('APP_CONFIG')

#load all sql queries from queries directory
queries = pugsql.module('queries/')
#connect to DB
queries.connect(app.config['DATABASE_URL'])

@app.cli.command('init')
def init_db():
    with app.app_context():
        db = queries._engine.raw_connection()
        with app.open_resource('tracks_playlists.sql', mode='r') as f:
            db.cursor().executescript(f.read())
        db.commit()

@app.route("/")
def hello():
	return "<h1>A Super awesome API that will allow you to create and listen to tracks over and over!</h1>"

@app.route("/recources/playlists/<int:id>", methods=['GET','DELETE'])
def playlists(id):
    if request.method == 'DELETE':
        return delete_playlist(id)
    elif request.method == 'GET':
        return get_playlist(id)

#this method will return a playlist based off of its id
def get_playlist(id):
    current_playlist = queries.search_by_id_playlists(id=id)
    if current_playlist:
        return current_playlist, status.HTTP_200_OK
    else:
        return {"Status":status.HTTP_404_NOT_FOUND}, status.HTTP_404_NOT_FOUND

#this method will delete a playlist based off of its id
def delete_playlist(id):
    if queries.delete_by_id_playlist(id=id):
        return {"Status":status.HTTP_204_NO_CONTENT}, status.HTTP_204_NO_CONTENT
    else:
        return {"Status":status.HTTP_400_BAD_REQUEST}, status.HTTP_400_BAD_REQUEST

#this method will create a playlist
@app.route("/recources/playlists", methods=['GET','POST'])
def create_playlist():
    required_fields = ['playlist_title','URL_list','username']
    user_data = request.data
    if not all([field in user_data for field in required_fields]):
        raise exceptions.ParseError()
    if (request.data.get('playlist_title')=='') or (request.data.get('URL_list')=='') or (request.data.get('username')==''):
        raise exceptions.ParseError()
    if queries.create_playlist(playlist_title= request.data.get('playlist_title'), URL_list=str(request.data.get('URL_list')), username=request.data.get('username'), description=request.data.get('description')):
        return {"Status":status.HTTP_201_CREATED}, status.HTTP_201_CREATED
    else:
        return {"Status":status.HTTP_400_BAD_REQUEST}, status.HTTP_400_BAD_REQUEST

#this method will pull all the data from the database for given user
#since this query returns an iterable we need to convert it to a list to return
#if the list is empty a 404 is returned else we return a list containing
#all the rows that match the user name
@app.route("/recources/playlists/<string:username>", methods=['GET'])
def get_user_playlist(username):
    user_playlists = list(queries.get_playlist_by_user(username=username))
    if user_playlists != []:
        return user_playlists, status.HTTP_200_OK
    else:
        return {"Status":status.HTTP_404_NOT_FOUND}, status.HTTP_404_NOT_FOUND

#this method will pull all the playlists from the database
#since the query returns an interable we can convert it to a list
# if the list is empty then nothing was found else we return the list
@app.route("/recources/playlists/all", methods=['GET'])
def list_all_playlists():
    all_playlists = list(queries.all_playlists())
    if all_playlists != []:
        return all_playlists, status.HTTP_200_OK
    else:
        return {"Status":status.HTTP_404_NOT_FOUND}, status.HTTP_404_NOT_FOUND
