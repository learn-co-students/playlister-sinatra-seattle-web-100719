require_relative './concerns/slugifiable'

class Song < ActiveRecord::Base
    has_many :song_genres
    has_many :genres, through: :song_genres
    belongs_to :artist

    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
end