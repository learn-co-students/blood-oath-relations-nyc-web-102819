class BloodOath
    
    attr_reader :initiation_date, :follower, :cult 

    @@all = []
    @@followers = []

    def initialize(initiation_date, follower, cult)
        @initiation_date = initiation_date
        @follower = follower
        @cult = cult

        @@all << self
        @@followers << @follower 
    end

    def self.followers
        @@followers
    end 

    def self.all
        @@all
    end 

    def initiation_date
        @initiation_date.to_s
    end 

    def self.first_oath
        sorted_bloodoaths_by_date = self.all.sort_by { |bo| bo.initiation_date }  #re-sort the array of bloodoaths to be sorted by inititiation date
        sorted_bloodoaths_by_date.first.follower #select the first element of that sorted array, and return the follower 
    end 

end