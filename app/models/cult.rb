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

    def cult_blood_oaths
        BloodOath.all.select do |oath|
            oath.cult == self
        end
    end

    def cult_ages
        cult_ages = cult_blood_oaths.collect do |oath|
            oath.follower.age
        end
    end

    def average_age
        cult_ages.reduce{ |sum, el| sum + el }.to_f / cult_ages.length
    end

    def my_followers
        my_blood_oaths = BloodOath.all.select do |oath|
            oath.cult == self
        end

        my_blood_oaths.collect do |oath|
            oath.follower
        end
    end

    def my_followers_mottos
        self.my_followers.each do |follower|
            puts follower.life_motto
        end
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

    def self.least_popular
        self.all.min_by do |cult|
            cult.cult_population    
        end
    end

    def self.locations
        all.collect do |cult|
            cult.location
        end
    end
    
    def self.most_common_location
        freq = locations.reduce(Hash.new(0)) { |h,v| h[v] += 1; h }
        locations.max_by { |v| freq[v] }
    end

end
