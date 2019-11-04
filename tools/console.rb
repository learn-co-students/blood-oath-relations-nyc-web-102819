require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

angels = Cult.new("Angels", "New York", "We will kill you with love.", 1970)
devils = Cult.new("Devils", "Los Angeles", "We will kill you with fire.", 1975)
cats = Cult.new("Cats", "Chicago", "All hail Garfield.", 1980)
dogs = Cult.new("Dogs", "Chicago", "All hail Fido.", 1990)

luke = Follower.new("Luke", 30, "Derp derp.")
bob = Follower.new("Bob", 56, "Merp merp.")
jane = Follower.new("Jane", 19, "Clurr clack.")
chris = Follower.new("Chris", 25, "Durrrmurr.")
alice = Follower.new("Alice", 67, "Balllalala.")

blood_oath_1 = BloodOath.new("1999-12-23", angels, luke)
blood_oath_2 = BloodOath.new("2019-11-27", devils, bob)
blood_oath_3 = BloodOath.new("1987-10-08", cats, jane)
blood_oath_4 = BloodOath.new("1996-09-17", angels, chris)
blood_oath_5 = BloodOath.new("2001-08-24", devils, alice)
blood_oath_6 = BloodOath.new("2013-07-30", cats, luke)
blood_oath_7 = BloodOath.new("2020-06-04", angels, bob)
blood_oath_8 = BloodOath.new("2000-05-09", devils, jane)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
