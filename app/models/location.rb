class Location < ActiveRecord::BASE
  def coordinates_for(location)
    coordinates = Location.find_by(location: location)

    if coordinates
      coordinates
    else
      lat_lng = Google.geocode(location)
      Coordinates.create!(location: location, latitude: lat_lng[0], longitude: lat_lng[1])
    end
  end
end
