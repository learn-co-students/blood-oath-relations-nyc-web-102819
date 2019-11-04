require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#CULT attr_accessor :name, :location, :founding_year, :slogan
manson = Cult.new("Manson Crew", "NY", 1998, "Never ever")
beyhive = Cult.new("Beyonce", "TX", 2003, "Bzz!")
angels = Cult.new("Angel Crew", "MA", 1997, "Wings!")
devils = Cult.new("Devil Crew", "CA", 1958, "Horns 4 ever")
giants = Cult.new("NY Giants", "NY", 1907, "Big Blue")

#FOLLOWER attr_accessor :name, :age, :life_motto
hector = Follower.new("Hector", 30, "YOLO")
sara = Follower.new("Sara", 19, "Haha")
bob = Follower.new("Bob", 57, "Ugh!")
aimee = Follower.new("Aimee", 38, "Yes!")
tom = Follower.new("Tom", 24, "Oy!")
sam = Follower.new("Sam", 13, "Hey!")

#BLOODOATH JOINER attr_accessor :cult, :follower, :initiation_date
oath1 = BloodOath.new(angels, hector)
oath1.initiation_date =("2019-03-07")
oath2 = BloodOath.new(giants, hector)
oath2.initiation_date =("2019-07-07")
oath3 = BloodOath.new(giants, aimee)
oath3.initiation_date =("2005-02-01")
oath4 = BloodOath.new(devils, bob)
oath4.initiation_date =("2002-08-10")
oath5 = BloodOath.new(beyhive, sara)
oath5.initiation_date =("2008-01-04")


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
