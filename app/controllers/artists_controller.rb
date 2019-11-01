require_relative '../models/artist'

class ArtistsController < ApplicationController
    get '/artists' do 
        @allArtists = Artist.all
        erb :'artists/index'
    end

    get '/artists/:slug' do
        @thisArtist = Artist.find_by_slug(params[:slug])
        erb :'artists/show'
    end

end
