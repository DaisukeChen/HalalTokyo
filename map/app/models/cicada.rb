class Cicada < ActiveRecord::Base
    geocoded_by :latitude, :longtitude
    after_validation :geocode
end
