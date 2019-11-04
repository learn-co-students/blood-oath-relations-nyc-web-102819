class Cult
    attr_reader :name, :location, :founding_year, :slogan
    attr_accessor :followers

    @@all = []
    
    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan

        @@all << self 
    end

    def cult_population
        find_cult.length
    end


    def average_age #returns a Float that is the average age of this cult's followers
        follower_ages = find_cult.map do |bloodoaths|
            bloodoaths.follower.age #returns array of follower ages
        end
        follower_ages.reduce(:+).to_f / follower_ages.size #add all ages together and divide by the size of the array
    end

    def my_followers_mottos #prints out all of the mottos for this cult's followers
        follower_mottos = find_cult.map do |bloodoaths|
            bloodoaths.follower.life_motto
        end
        follower_mottos.each do |motto|
            puts motto
        end
    end

    def find_cult #helper method - returns array of a cult's blood oaths
        BloodOath.all.select do |cult|
            cult.cult == self 
        end
    end

    def recruit_follower(initiation_date, follower) 
        BloodOath.new(initiation_date, self, follower) 
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
        self.all.find do |cult|
            cult.location == location
        end
    end

    def self.find_by_founding_year(founding_year)
        self.all.find do |cult|
            cult.founding_year == founding_year
        end
    end

    def self.least_popular #returns the Cult instance who has the least number of followers :(
         bloodoath_cults.min_by {|cult| bloodoath_cults.count(cult)} 
         #count how many times each cult appears return the Cult instance that appears the least
    end

    def self.most_common_location #returns a String that is the location with the most cults
        locations = self.all.map do |cult|
            cult.location
        end
        locations.max_by {|loc| locations.count(loc)}
    end
       
    def self.bloodoath_cults #helper method #iterage through BloodOath.all and returns a new array of cults
        BloodOath.all.map do |bloodoaths| 
            bloodoaths.cult
        end
    end  

end


#pre-helpers#

  # def self.least_popular #returns the Cult instance who has the least number of followers :(
    #    cults = BloodOath.all.map do |bloodoaths|  #iterage through BloodOath.all and returns a new array of cults
    #         bloodoaths.cult
    #     end
    #     cults.min_by {|cult| cults.count(cult)} 
    #     #count how many times each cult appears return the Cult instance that appears the least
    # end

    # def cult_population
    #     pop_array = BloodOath.all.select do |cult|
    #     cult.cult == self            
    #     end
    #     pop_array.length
    # end