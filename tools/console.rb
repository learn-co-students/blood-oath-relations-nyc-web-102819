require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

b_church = Cult.new("Black Church", "Salem", 1669, "we love cults!")
m_family = Cult.new("Manson Family", "LA", 1969, "Charles Manson rocks!")
d_day = Cult.new("Dooms Day", "Salt Lake City", 1999, "The world is ending soon")
i_fire = Cult.new("Internal Fire", "Salem", 1912, "We do need no water!")

john = Follower.new("John Doe", 35, "Life Sucks")
jane = Follower.new("Jane Doe", 95, "I just want something to believe in")
nancy = Follower.new("Nancy", 60, "Finding a new religion is cool")
jesus = Follower.new("Jesus", 29, "I don't care")

bloodoath1 = BloodOath.new(jane, m_family, "1960-12-13")
bloodoath2 = BloodOath.new(jane, b_church, "1940-05-23")
bloodoath3 = BloodOath.new(john, d_day, "1990-12-03")
bloodoath4 = BloodOath.new(jesus, i_fire, "1999-6-13")
#
m_family.recruit_follower(nancy, "1873-12-12")
b_church.recruit_follower(john, "2000-12-09")
b_church.recruit_follower(nancy, "2005-01-08")
#
nancy.join_cult(d_day, "1989-12-04")


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits

