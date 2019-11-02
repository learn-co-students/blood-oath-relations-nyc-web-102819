class Follower

    attr_accessor :name, :age, :life_motto
  
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

    def blood_oaths
      BloodOath.all.select do |blood_oath|
        blood_oath.follower == self
      end
    end

    def cults
      # returns an array of this persons cults
      blood_oaths.map do |blood_oath|
        blood_oath.cult
      end
    end

    def join_cult(cult)
      BloodOath.new(self,cult,"Today's date")
    end

    def self.of_a_certain_age(num)
      self.all.select do |follower|
        follower.age >= num
      end

    end

    def my_cult_slogans
      cults.map do |cult|
        cult.slogan
      end
    end

    def self.follower_activity_sort
      follower_activity = self.all.map do |follower|
        {follower => follower.cults.length}
      end
      sorted_follower_activity = follower_activity.sort_by do |follower|
        follower.values[0]
      end
      sorted_follower_activity.reverse
    end
    def self.most_active
    self.follower_activity_sort[0]
    end
    def self.top_ten
      follower_activity_sort[0...9]
    end
 

end
