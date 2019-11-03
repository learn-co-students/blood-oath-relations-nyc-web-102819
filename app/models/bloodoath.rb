class Initiation
    attr_accessor :initiation_date, :follower, :cult
    @@all_Initiations = []

    def initialize(initiation_date, follower, cult)
        @initiation_date = initiation_date
        @follower = follower
        @cult = cult
        @@all_Initiations << self
    end

    def self.all_initiations
        @@all_Initiations
    end
end
