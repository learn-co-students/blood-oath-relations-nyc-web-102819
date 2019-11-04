require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

black_church = Cult.new( "Black Church", "Salem", 1669, "we love cults!")
manson_family = Cult.new("Manson Family", "LA", 1969, "Charles Manson rocks!")
dooms_day = Cult.new("Dooms Day", "Salt Lake City", 1999, "The world is ending soon")
dooms_day2 = Cult.new("Dooms Day2", "Salt Lake City", 1999, "The world is ending soon")


john_doe = Follower.new("John Doe", 35, "Life Sucks")
jane_doe = Follower.new("Jane Doe", 95, "I just want something to believe in")
nancy = Follower.new("Nancy", 60, "Finding a new religion is cool")

bloodoath1 = BloodOath.new("1960-12-13", manson_family, jane_doe)
bloodoath2 = BloodOath.new("1940-05-23", black_church, jane_doe)
bloodoath3 = BloodOath.new("1990-12-03", dooms_day, john_doe)
bloodoath4 = BloodOath.new("1873-12-12", manson_family, nancy)
bloodoath5 = BloodOath.new("2000-12-09", black_church, john_doe)
#bloodoath6 = BloodOath.new("1989-12-04", dooms_day, nancy)


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits

