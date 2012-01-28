class Geolocation
  
  include GeoConstants
  
  def initialize
    @distances = []
  end
  
  def getPossibleLocations(lat,long,meters)
    possible_locations = []
    Location.all.each do |loc|
      puts "a loc is #{loc}"
      user_lat = lat.to_i
      user_long = long.to_i
      loc_lat = loc.coordinate.latitude.to_i
      loc_long = loc.coordinate.longitude.to_i
      distance_obj = haversine_distance(user_lat,user_long,
                                   loc_lat,loc_long)
      if(distance_obj["ft"] < meters)
        possible_locations << loc
      end
    end 
    return possible_locations
  end

  def haversine_distance(lat1,lon1,lat2,lon2)

    dlon = lon2 - lon1
    dlat = lat2 - lat1

    dlon_rad = dlon * GeoConstants::RAD_PER_DEG 
    dlat_rad = dlat * GeoConstants::RAD_PER_DEG

    lat1_rad = lat1 * GeoConstants::RAD_PER_DEG
    lon1_rad = lon1 * GeoConstants::RAD_PER_DEG

    lat2_rad = lat2 * GeoConstants::RAD_PER_DEG
    lon2_rad = lon2 * GeoConstants::RAD_PER_DEG

    a = (Math.sin(dlat_rad/2))**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * (Math.sin(dlon_rad/2))**2
    c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))

    dMi = GeoConstants::RMILES * c          # delta between the two points in miles
    dKm = GeoConstants::RKM * c             # delta in kilometers
    dFeet = GeoConstants::RFEET * c         # delta in feet
    dMeters = GeoConstants::RMETERS * c     # delta in meters
    
    location_obj = {}
    location_obj["mi"] = dMi
    location_obj["km"] = dKm
    location_obj["ft"] = dFeet
    location_obj["m"] = dMeters

    return location_obj
  end
  

end
