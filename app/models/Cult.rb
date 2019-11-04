class Cult
    attr_accessor :name, :location, :founding_year, :slogan

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def self.all
        @@all
    end

    def bloodoaths
        BloodOath.all.select { |oath| oath.cult == self }
    end

    def followers
        bloodoaths.map { |bloodoath| bloodoath.follower }
    end

    def recruit_follower(follower)
        BloodOath.new(self, follower)
    end

    def cult_population
        bloodoaths.select { |cult| cult.follower }.count
    end

    def self.find_by_name(name)
        self.all.find { |cult| cult.name == name }
    end

    def self.find_by_location(location)
        self.all.find { |cult| cult.location == location }
    end

    def self.find_by_founding_year(year)
        self.all.find { |cult| cult.founding_year == year }
    end

    def average_age
        total = followers.reduce(0) { | acc, follower | acc + follower.age }
        total / followers.length
    end

    def my_followers_mottos
        followers.map { |follower| follower.life_motto }
    end

    def self.least_popular
        self.all.min_by { |cult| cult.followers.length }
    end

    def self.most_common_location
        locations = {}
        self.all.each { |cult| locations[cult.location] ? locations[cult.location] += 1 : locations[cult.location] = 1 }
        locations
    end

end