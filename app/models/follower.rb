class Follower

  attr_reader :name, :age, :life_motto

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

  def cults
    BloodOath.all.map do |bo|
      bo.cult if bo.follower == self
    end.compact
  end

  def join_cult(cult, initiation_date)
    BloodOath.new(self, cult, initiation_date)
  end

  def self.of_a_certain_age(age)
    self.all.select do |follower|
      follower.age >= age
    end
  end

  ### Advanced Methods

  def my_cults_slogans
    cults.map do |cult|
      cult.slogan
    end
  end

  def self.most_active
    self.all.max_by do |follower|
      follower.cults.length
    end
  end

  def self.top_ten
    self.all.sort_by do |follower|
      follower.cults.length
    end.first(10)
  end

  ### BONUS!

  def fellow_cult_members
    fellow_members = []
    cults.each do |cult|
      BloodOath.all.each do |oath|
        fellow_members << oath.follower if oath.cult == cult && oath.follower != self
      end
    end
    fellow_members.uniq 
  end

end
