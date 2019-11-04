class Follower

    attr_accessor :name, :age, :life_motto, :cults, :blood_oaths

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self     
    end 

    def join_cult(initiation_date, cult)
        BloodOath.new(initiation_date, self, cult)
    end

    def bloodoaths
        BloodOath.all.select { |bloodoath| bloodoath.follower == self }
    end

   def cults
        bloodoaths.map { |bloodoath| bloodoath.cult }
   end

   def my_cults_slogans
        p cults.map { |cult| cult.slogan }
   end 

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        self.all.select { |follower| follower.age >= age }
    end 

    def self.bloodoath_followers_array
        BloodOath.all.map { |bo| bo.follower } 
    end 

    def self.most_active
        bloodoath_followers_array.max_by { |follower| bloodoath_followers_array.count(follower) }
    end 

    def self.top_three
        bloodoath_followers_array.max(3) { |follower| bloodoath_followers_array.count(follower) }
    end 

end
 