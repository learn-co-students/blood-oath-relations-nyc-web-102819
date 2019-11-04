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

    def bloodoaths
        BloodOath.all.select { |oath| oath.follower == self }
    end

    def cults
        bloodoaths.map { |follower| follower.cult }
    end

    def join_cult(cult)
        BloodOath.new(cult, self)
    end

    def self.of_a_certain_age(age)
        self.all.select { |follower| follower.age > age }
    end

    def my_cults_slogans
        cults.map { |cult| cult.slogan }
    end

    def self.most_active
        cults = {}
        self.all.each { |follower| cults[follower.cults] ? cults[follower.cults] += 1 : cults[follower.cults] = 1 }
    end

    def self.follower_activity_sort
        activity = self.all.map { |follower| {follower => follower.cults.length} }
        sorted_activity = activity.sort_by { |follower| follower.values[0] }
        sorted_activity.reverse
    end

    def self.top_ten
        self.follower_activity_sort[0...9]
    end

end