class SongsController < ApplicationController

  #index action
  get '/songs' do
    @songs = Song.all 
    #binding.pry
    erb :'songs/index'
  end #action

  #new action
  get '/songs/new' do
    @genres = Genre.all 
    erb :'songs/new'
  end #action

  #show action
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist 
    @genres = []
    SongGenre.all.each do |song_genre|
      if song_genre.song_id == @song.id
        @genres << Genre.find_by(id: song_genre.genre_id)
      end #if
    end #each
    #@genres = SongGenre.all.find_by(song_id: @song.id)
    #binding.pry
    erb :'songs/show'
  end #action
  
  #edit action
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all 
    erb :'/songs/edit'
  end #edit

  #create action
  post '/songs' do
    #binding.pry
    @song = Song.create(name: params[:Name])
    @artist = Artist.find_by(name: params["Artist Name"])
    #binding.pry 
    if @artist.nil? #Song created without existing artist
      @artist = Artist.create(name: params["Artist Name"])
    end

    @artist.songs << @song 

    @genres = params[:genres]
    @genres.each do |genre|
      @song.genres << Genre.find_by(id: genre.to_i) 
    end #each

    redirect "/songs/#{@song.slug}"
  end #action

  #update action
  patch "/songs/:slug" do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by(name: params["Artist Name"])
    

    if @artist.nil?
      @artist = Artist.create(name: params["Artist Name"])
    end #if

    #binding.pry
    @song.update(artist: @artist)

    #binding.pry 
    @song.genres.clear 
    @genres = params[:genres]
    @genres.each do |genre|
      @song.genres << Genre.find_by(id: genre.to_i) 
    end #each

    @song.save 

    redirect "/songs/#{@song.slug}"
  end #action

end #class