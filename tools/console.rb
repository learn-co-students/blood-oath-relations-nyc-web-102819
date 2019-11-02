require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# name, age, life_motto
barak = Follower.new("Barak", 29, "Learn Love Code")
carlos = Follower.new("Carlos", 30, "Why not?" )
tim = Follower.new("Timothy", 49, "Verizon is better than att")
gabe = Follower.new("Gabe",16,"naruto")

# name, location, founding_year, slogan

flatiron = Cult.new("Flatiron School", "downtown", 2011,"Codelab")
app_academy = Cult.new("App Academy", "nowhere", 1997, "we're not as good")


# follower, cult, initiation_date
b1 = BloodOath.new(barak,flatiron,"10/28/2019")
b2 = BloodOath.new(carlos,flatiron,"9/7/2015")
b3 = BloodOath.new(tim,app_academy,"9/24/2009")


# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
