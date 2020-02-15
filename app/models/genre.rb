class Genre < ActiveRecord::Base
    has_many :artist
    has_many :song_genre
    has_many :songs, through: :artist

end