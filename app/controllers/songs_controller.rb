require 'rack-flash'
class SongsController < ApplicationController
    
    use Rack::Flash

    get '/songs' do 
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do 
        @artists = Artist.all
        # binding.pry
        erb :'songs/new'
    end

    get '/songs/:slug/edit' do 
        @artists = Artist.all 
        @song = Song.find_by_slug(params[:slug])
        # binding.pry
        erb :"/songs/edit"
    end

    patch '/songs/:slug' do 
        
        @song = Song.find_by_slug(params[:slug])
        # @song.update(name: params[:song][:name])

        @artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.artist = @artist
        # binding.pry
        @song.genre_ids = params[:genres]
        @song.save
    
        # if !params[:artist][:name].empty? 
        #   artist = Artist.create(name: params[:artist][:name])
        #   @song.artist = artist
        #   artist.songs << @song  
        # elsif params[:song].keys.include?("artist_id")
        #   @song.update(artist_id: params[:song][:artist_id])
        # end
        flash[:message] = "Successfully updated song."

        redirect "/songs/#{@song.slug}"
      end

    post '/songs' do 
        @song = Song.create(name: params[:song][:name])
        
        @artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.artist = @artist
        # @song.save
    
        # @artist
        ##########################################?
        # binding.pry 
        @song.genre_ids = params[:genres]
        @song.save
        # binding.pry
        # @song.genres << Genre.find_by(id: params[:genres][?])
        # @song.genres = Genre.find_by(params[:genres])
        flash[:message] = "Successfully created song."
        redirect "/songs/#{@song.slug}"
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