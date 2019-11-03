class Cult
    attr_accessor :name, :location, :founding_year, :slogan
    @@all_cults = []

    def initialize (name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan

        @@all_cults << self
    end

    def self.all_cults
        @@all_cults
    end

    def recruit_follower(initiation_date, follower)
        Initiation.new(initiation_date, follower, self)
    end

    def cult_followers
        Initiation.all_initiations.select do |each|
            each.cult == self
        end
    end
    
    def cult_population
        self.cult_followers.count
    end

    def self.find_by_name(name)
        all_cults.select do |each| 
            each.name == name
        end
    end

    def self.find_by_location(location)
        all_cults.select do |each|
            each.location == location
        end
    end

    def self.find_by_founding_year(year)
        all_cults.select do |each|
            each.founding_year == year
        end
    end

    def avg_age
        sum = self.cult_followers.reduce(0) do |acc,each| 
            acc + each.follower.age 
        end
        sum/self.cult_population
    end

    def my_followers_mottos
        self.cult_followers.map do |each|
            each.follower.life_motto
        end
    end

    # get lowest # of followers
    # look for cult with that number

    def self.least_popular
        min_followers = Cult.all_cults.map do |each|
            each.cult_population
        end.min
         
        Cult.all_cults.select do |each| 
            each.name if each.cult_population == min_followers
        end
    end
    
    # pull each location 
    # calculate frequency 
    # pull location with highest freq

    def self.most_common_location
        
        locations = Cult.all_cults.map {|each| each.location }

        freq = locations.inject(Hash.new(0)) do |k,v|
            k[v] += 1;
            k
        end

        locations.max_by do |v| 
            freq[v]
        end

    end

        

end

