class BloodOath

  attr_reader :follower, :cult, :initiation_date
  
  @@all = []

  def initialize(follower, cult, initiation_date)
    @initiation_date = initiation_date
    @cult = cult
    @follower = follower

    @@all << self
  end

  def self.all 
    @@all
  end

  ### Advanced Methods

  def self.parse_date(date)
    date.split("-").map do |i|
      i.to_i
    end
  end

  def self.first_oath
    self.all.min_by do |oath|
      self.parse_date(oath.initiation_date)
    end.follower
  end

end