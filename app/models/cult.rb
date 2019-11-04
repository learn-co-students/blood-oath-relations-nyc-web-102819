class Cult
    attr_accessor :name, :location, :slogan
    attr_reader :founding_year
    @@all = []

    def initialize(name, location, slogan, founding_year)
        @name = name
        @location = location
        @slogan = slogan
        @founding_year = founding_year
        @@all << self
    end

    def recruit_follower(initiation_date, follower)
        BloodOath.new(initiation_date, self, follower)
    end

    def cult_population
        BloodOath.all.select do |oath|
            oath.cult == self
        end.length
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find do |cult|
            cult.name == name
        end
    end

    def self.find_by_location(location)
        self.all.find_all do |cult|
            cult.location == location
        end
    end

    def self.find_by_founding_year(founding_year)
        self.all.find_all do |cult|
            cult.founding_year == founding_year
        end
    end
end
