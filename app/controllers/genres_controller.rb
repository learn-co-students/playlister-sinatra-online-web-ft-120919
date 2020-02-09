class GenresController < ApplicationController
    #index action
    get '/genres' do
      @genres = Genre.all 
      erb :'genres/index'
    end #action

    #show action
    get '/genres/:slug' do
      @genre = Genre.find_by_slug(params[:slug])
      @songs = @genre.songs
      @artists = @songs.map{|song| song.artist}
      erb :'genres/show'
    end #action
  
  end #class