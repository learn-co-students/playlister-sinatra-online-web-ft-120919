class ArtistsController < ApplicationController
    #index action
    get '/artists' do
      @artists = Artist.all 
      erb :'artists/index'
    end #action

    #show action 
    get '/artists/:slug' do
      @artist = Artist.find_by_slug(params[:slug])
      @songs = @artist.songs 
      @genres = @artist.genres
      erb :'artists/show'
    end #action
  
  end #class
