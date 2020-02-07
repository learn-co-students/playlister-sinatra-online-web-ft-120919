class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song = Song.create(params[:song])
    @genres = params[:genres].map do |g_name|
      Genre.find_or_create_by(name: g_name)
    end
    @song.artist = @artist
    @song.genres << @genres

    @song.genres =
    if @song.save
      flash[:message] = "Successfully created song."
      redirect "/songs/#{@song.slug}"
    else
      erb :'/songs/new'
    end
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @genres = params[:genres].map do |g_name|
      Genre.find_or_create_by(name: g_name)
    end
    if @song.update(params[:song])
      flash[:message] = 'Successfully updated song.'
      redirect "/songs/#{@song.slug}"
    else
      erb :'/songs/edit'
    end
  end
end
