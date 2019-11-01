require_relative '../models/song'

class SongsController < ApplicationController

    enable :sessions

    get '/songs' do 
        @allSongs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'songs/new'
    end

    get '/songs/:slug' do
        slugOfSong = params[:slug]
        @thisSong = Song.find_by_slug(slugOfSong)
        @statement = session[:statement]
        erb :'songs/show'
    end

    post '/songs' do
        @thisArtist = Artist.find_or_create_by(name: params[:artist_name])
        @newlyAddedSong = Song.create(name: params[:song_name])
        @thisArtist.songs << @newlyAddedSong
        @songGenres = params[:genres].map {|genreID| SongGenre.create(song_id: @newlyAddedSong.id, genre_id: genreID.to_i)}
        session[:statement]="Successfully created song."
        redirect to "/songs/#{@newlyAddedSong.slug}"
    end

    get '/songs/:slug/edit' do
        @thisSong = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :'songs/edit'
    end

    patch '/songs/:slug' do 
        @thisSong = Song.find_by_slug(params[:slug])
        @thisSong.name = params[:song_name]
        @thisArtist = Artist.find_or_create_by(name: params[:artist_name])
        @thisArtist.songs << @thisSong
        # binding.pry
        session[:statement]="Successfully updated song."
        redirect to "/songs/#{@thisSong.slug}"
    end

end