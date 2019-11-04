class BloodOath
    attr_reader :initiation_date, :cult, :follower
    
    @@all = []

    def initialize(initiation_date, cult, follower)
        @initiation_date = initiation_date
        @cult = cult 
        @follower = follower 

        @@all << self
    end

    def self.all 
        @@all
    end

    def self.first_oath #returns the Follower instance for the follower that made the very first blood oath
        by_date = self.all.sort_by{ |bloodoaths| bloodoaths.initiation_date} #iterate through bloodoaths - organize by initiation date)
        #return the follower from that initiation date
        by_date.first.follower
    end
   
  
end