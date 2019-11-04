class Follower
    attr_accessor :name, :age, :life_motto
    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def join_cult(initiation_date, cult)
        BloodOath.new(initiation_date, cult, self)
    end

    def cults
        BloodOath.all.select do |oath|
            oath.follower == self
        end
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        self.all.select do |follower|
            follower.age >= age
        end
    end
end
