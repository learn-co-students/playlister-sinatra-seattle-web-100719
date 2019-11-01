require_relative '../models/genre'

class GenresController < ApplicationController
    get '/genres' do 
        @allGenres = Genre.all
        erb :'genres/index'
    end

    get '/genres/:slug' do
        @thisGenre = Genre.find_by_slug(params[:slug])
        erb :'genres/show'
    end

end