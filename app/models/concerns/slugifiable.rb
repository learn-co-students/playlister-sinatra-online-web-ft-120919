module Slugifiable
    module InstanceMethods

        def slug 
            str = self.name
            arr = str.split(" ")
            arr.map{|word| word.downcase}.join("-")
        end #slug

    end #InstanceMethods

    module ClassMethods
        def find_by_slug(slug)
            self.all.find{|thing| thing.slug == slug}
        end #self.find_by_slug
    end #ClassMethods

end  #Slugifiable