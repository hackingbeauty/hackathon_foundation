namespace :import do
  desc "import starbucks geolocation data"
  task :starbucks => :environment do
    begin
      # location_type = [
      #   "starbucks","peets","caribou coffee","tim horton's",
      #   "tully's","seattle's best","coffee bean & tea leaf",
      #   "coffee beanery","dunn bros. coffee","port city java"
      # ].sort
      # location_type.each do |name|
      #   LocationType.create!(:name => name)
      # end
      file = "#{Rails.root}/lib/tasks/starbucks.csv"
      File.readlines(file).each do |line|
        starbucks = line.split(",")        
        type = LocationType.find_by_name("starbucks")
        name = starbucks[1]
        address1 = starbucks[2]
        address2 = starbucks[3]
        city = starbucks[4]
        state = starbucks[5]
        zip = starbucks[6]
        phone = starbucks[7]
        connection_type = starbucks[8]
        latitude = starbucks[9]
        longitude = starbucks[10].gsub("\r\n","")
        coordinate = Coordinate.create!(:latitude => latitude, :longitude => longitude)
        Location.create(:type_id => type.id, :name => name, :address1 => address1, :address2 => address2, 
                        :city => city, :state => state, :zip => zip, :phone => phone,
                        :connection_type => connection_type, :coordinate_id => coordinate.id)
        puts "starbucks added: #{starbucks}"
        puts "------------------------"
      end
    rescue StandardError => e
      puts "oops, you have an error: #{e.message}"
    end
  end
end

