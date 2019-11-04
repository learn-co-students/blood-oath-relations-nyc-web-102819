require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

angels = Cult.new("Angels", "Los Angeles", 1975, "We are the angels.")
devils = Cult.new("Devils", "New York", 1950, "We are the devils.")
monsters = Cult.new("Monsters", "Chicago", 1975, "We are the monsters.")
mavericks = Cult.new("Mavericks", "Chicago", 1999, "We are the mavericks.")
dudes = Cult.new("Dudes", "Los Angeles", 1999, "We are the dudes.")


jonah = Follower.new("Jonah", 26, "Let's go!!!")
luke = Follower.new("Luke", 30, "Let's not!!!")
mike = Follower.new("Mike", 70, "Sup!!!")
steve = Follower.new("Steve", 41, "How u doin?")
jimmy = Follower.new("Jimmy", 15, "Yo.")
jake = Follower.new("Jake", 16, "It's jake.")
bobby = Follower.new("Bobby", 17, "Hiya.")

BloodOath1 = BloodOath.new("1980-10-10", jonah, angels)
BloodOath2 = BloodOath.new("1983-4-23", luke, devils)
BloodOath3 = BloodOath.new("1990-2-20", mike, angels)
BloodOath4 = BloodOath.new("1990-2-20", jonah, devils)
BloodOath4 = BloodOath.new("1990-2-20", jimmy, monsters)
BloodOath4 = BloodOath.new("1990-2-20", jimmy, monsters)
BloodOath4 = BloodOath.new("1990-2-20", luke, mavericks)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
