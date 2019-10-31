module Slugifiable
    module InstanceMethods
        def slug
            self.name.gsub(/[ ]/, '-').downcase
        end
    end

    module ClassMethods
        def find_by_slug(slugged_name)
            slugged_name_split = slugged_name.split('-')
      
            self.find_by(name: slugged_name_split.map {|word| word.capitalize}.join(" ") ) 
        end
    end
end