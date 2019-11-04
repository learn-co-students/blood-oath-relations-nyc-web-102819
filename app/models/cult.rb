class Cult

  attr_reader :name, :location, :founding_year, :slogan

  @@all = []
  
  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan

    @@all << self 
  end

  def self.all
    @@all 
  end

  def recruit_follower(follower, initiation_date)
    BloodOath.new(follower, self, initiation_date)
  end

  def bloodoaths
    BloodOath.all.select do |bo|
      bo.cult == self
    end
  end

  def cult_population
    bloodoaths.length
  end

  def self.find_by_name(name)
    self.all.find do |cult|
      cult.name == name 
    end
  end

  def self.find_by_location(location)
    self.all.select do |cult|
      cult.location == location
    end
  end

  def self.find_by_founding_year(founding_year)
    self.all.select do |cult|
      cult.founding_year == founding_year
    end
  end

  ### Advanced Methods

  def average_age
    total_age = bloodoaths.reduce(0.0) do |sum, i|
      sum + i.follower.age
    end
    total_age / cult_population
  end

  def my_followers_mottos
    bloodoaths.map do |bo|
      bo.follower.life_motto
    end
  end

  def self.least_popular
    self.all.min_by do |cult|
      cult.cult_population
    end
  end

  def self.most_common_location
    location_cult = {}
    self.all.each do |cult|
      location_cult[cult.location] ||= location_cult[cult.location] = []
      location_cult[cult.location] << cult.name
    end
    location_cult.max_by do |l, c|
      c.length
    end[0]   
  end

end
