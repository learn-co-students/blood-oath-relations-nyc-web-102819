class Follower
    attr_reader :name, :age, :life_motto
    attr_accessor :cults
    
    @@all = []
    def initialize(name, age, life_motto)
      @name = name
      @age = age
      @life_motto = life_motto
      
      @@all << self
    end

    def self.all 
        @@all
    end

    def self.of_a_certain_age(age)
        self.all.select do |follower|
            follower.age >= age
        end
    end

    def self.most_active #returns the Follower instance who has joined the most cults
        bloodoath_followers.max_by {|follower| bloodoath_followers.count(follower)}
    end

    def self.top_ten #returns an Array of followers; they are the ten most active followers
        bloodoath_followers.max(10) {|follower| bloodoath_followers.count(follower)}
    end

    def self.bloodoath_followers #helper method #iterage through BloodOath.all and returns a new array of followers
        BloodOath.all.map do |bloodoaths| 
            bloodoaths.follower
        end
    end

    def 

    
    def cults
        cults_array = BloodOath.all.select do |bloodoaths|
            bloodoaths.follower == self
        end
        cults_array.map do |bloodoaths|
            bloodoaths.cult
        end
    end

    def join_cult(initiation_date, cult)
        BloodOath.new(initiation_date, cult, self)
    end

   

    def my_cults_slogans #prints out all of the slogans for this follower's cults
        cult_slogans = my_bloodoaths.map do |bloodoaths|
            bloodoaths.cult.slogan
        end
        cult_slogans.each do |slogan|
            puts slogan
        end
    end

    def my_bloodoaths #helper method: returns an array of a follower's blood oaths
        BloodOath.all.select do |bloodoaths|
            bloodoaths.follower == self
        end
    end



 


end
