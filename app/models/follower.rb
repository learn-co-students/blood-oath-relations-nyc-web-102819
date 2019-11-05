class Follower
    attr_accessor :name, :age, :life_motto
    attr_reader :cults
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

    def my_cults
        my_blood_oaths = BloodOath.all.select do |oath|
            oath.follower == self
        end

        my_blood_oaths.collect do |oath|
            oath.cult
        end
    end

    def my_cults_slogans
        self.my_cults.each do |cult|
            puts cult.slogan
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

    def self.most_active
        self.all.max_by do |follower|
            follower.cults.count
        end
    end

    def self.top_three
        self.all.max_by(3) do |follower|
            follower.cults.count
        end
    end
end
