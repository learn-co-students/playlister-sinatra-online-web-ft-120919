class SongsController < ApplicationController

    get '/songs' do 
        # @song =
        # @genre =

        erb :'songs/index'
        
    end


end