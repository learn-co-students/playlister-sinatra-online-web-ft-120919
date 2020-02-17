class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        self.name.downcase.gsub(/\s+/, '-')
        # str = self.username.split(" ")
        # str.map{|word| word.downcase}.join("-")
    end

    def self.find_by_slug(slug)
        self.all.find{ |user_slug| user_slug.slug == slug }
    end
end