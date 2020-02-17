class SongsController < ApplicationController

    get '/songs' do 
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do 
        @artists = Artist.all
        erb :'songs/new'
    end

    post '/songs/new' do 
        redirect '/songs/:slug'
    end


    get '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        # binding.pry
        erb :'songs/show'
    end




end

# a = @song.artist.name
        # binding.pry

        # @artist = Song.find_by_slug(params[:slug]).artist