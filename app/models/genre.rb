class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        self.name.downcase.gsub(/\s+/, '-')
        # str = self.username.split(" ")
        # str.map{|word| word.downcase}.join("-")
    end

    def self.find_by_slug(slug)
        self.all.find{ |user_slug| user_slug.slug == slug }
    end

end