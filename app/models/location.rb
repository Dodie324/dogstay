class Location < ActiveRecord::Base
  has_many :users

  geocoded_by :location

  validates :location, presence: true

  def coordinates_for(location)
    location = location.downcase.gsub(/\W/, "")
    coordinates = Location.find_by(location: location)
    if coordinates
      coordinates
    else
      lat_lng = Geocoder.coordinates(location)
      if lat_lng == nil
        flash[:notice] = "Please submit a valid location"
        return root_path
      else
        Location.create!(
          location: location,
          latitude: lat_lng[0],
          longitude: lat_lng[1]
        )
      end
    end
  end
end
