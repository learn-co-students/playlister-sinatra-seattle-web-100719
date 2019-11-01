module Slugifiable
    module InstanceMethods
        def slug
            self.name.gsub(/[ ]/, '-').downcase
        end
    end

    module ClassMethods
        def find_by_slug(slugged_name)
            slugged_name_split = slugged_name.split('-')
            downcased_slug = slugged_name_split.map {|word| word}.join(" ")

            self.all.detect do |object|
                object.name.downcase == downcased_slug
            end
        end
    end
end