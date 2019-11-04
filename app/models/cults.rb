class Cult

    attr_accessor :name, :location, :slogan, :followers
    attr_reader :founding_year

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan 

        @@all << self     
    end 

    def recruit_follower(initiation_date, follower)
        BloodOath.new(initiation_date, follower, self)
    end

    def bloodoaths 
        BloodOath.all.select { |bloodoath| bloodoath.cult == self }
    end 

    def followers
        bloodoaths.map { |bloodoath| bloodoath.follower }
    end 
    
    def cult_population
        followers.count 
    end

    def followers_ages
        followers.map { |follower| follower.age }
    end 

    def average_age
        followers_ages.sum / followers_ages.length
    end 

    def my_followers_mottos
        mottos = followers.map { |follower| follower.life_motto }
        puts mottos 
        mottos
    end 

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.select { |cult| cult.name == name }
    end

    def self.find_by_location(location)
        self.all.select { |cult| cult.location == location }
    end

    def self.find_by_founding_year(founding_year)
        self.all.select { |cult| cult.founding_year == founding_year }
    end

    def self.least_popular 
        self.all.min_by { |cult| cult.cult_population }
    end 

    def self.cult_locations
        self.all.map { |cult| cult.location }
    end 

    def self.most_common_location
        cult_locations.max_by { |loc| cult_locations.count(loc) }
    end 

    def self.least_common_location
        cult_locations.min_by { |loc| cult_locations.count(loc) }
    end 

    # def self.cult_locations
    #     locations = {}
    #     self.all.each do |cult|
    #       if !locations[cult.location]
    #         locations[cult.location] = 1
    #       else
    #         locations[cult.location] += 1
    #       end
    #     end
    #     return locations
    #   end

    # def self.most_common_location
    #     location = cult_locations.max_by { |location, count| count }
    #     location[0]
    # end

end
