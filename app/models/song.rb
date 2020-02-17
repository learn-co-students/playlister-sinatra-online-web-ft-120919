class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        self.name.downcase.gsub(/\s+/, '-')
    end

    def self.find_by_slug(slug)
        self.find_by(name: slug.split("-").collect {|string| string.capitalize}.join(", ").tr(',', ''))
    end

end