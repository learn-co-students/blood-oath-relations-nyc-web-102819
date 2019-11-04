require 'time'

class BloodOath
    attr_accessor :cult, :follower, :initiation_date

    @@all = []

    def initialize(cult, follower)
        @cult = cult
        @follower = follower
        @initiation_date = "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        sorted = self.all.sort_by { |oath| Time.parse(oath.initiation_date) }
        sorted[0].follower
    end
end