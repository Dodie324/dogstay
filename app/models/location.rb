class Location < ActiveRecord::Base
  has_many :users

  geocoded_by :location

  validates :location, presence: true
end
