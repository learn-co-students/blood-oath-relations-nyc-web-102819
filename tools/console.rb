require_relative '../config/environment.rb'


def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# initialize(name, age, life_motto)
barak = Follower.new('Barak', 17, 'Learn Love Code')
carlos = Follower.new('Carlos', 30, 'Why not?' )
tim = Follower.new('Timothy', 49, 'Verizon is better than att')
f4 = Follower.new('follower4', 1, 'f4')
f5 = Follower.new('follower5', 1, 'f5')
f6 = Follower.new('follower6', 1, 'f6')
f7 = Follower.new('follower7', 1, 'f7')
f8 = Follower.new('follower8', 1, 'f8')
f9 = Follower.new('follower9', 1, 'f9')
f10 = Follower.new('follower10', 1, 'f10')
f11 = Follower.new('follower11', 1, 'f11')

# name,location, founding_year, slogan
flatiron = Cult.new('Flatiron School', 'downtown', 2011, 'Codelab')
app_academy = Cult.new('App Academy', 'nowhere', 1997, 'we’re not as good')
flat_2 = Cult.new('Flatiron campus 2', 'downtown', 2013, 'Codelab 2')

# initiation_date, follower, cult
b1 = Initiation.new('10/28/2019', barak, flatiron) # add barak to flatiron
b2 = Initiation.new('9/7/2015', carlos, flatiron) # add carlos to flatiron
b3 = Initiation.new('9/24/2009', tim, app_academy) # add tim to app academy

# recruit_follower(initiation_date, follower)
r1 = app_academy.recruit_follower("1/1/2000", carlos) # add carlos to app academy
r1 = flat_2.recruit_follower("1/1/2000", carlos) 
r1 = flat_2.recruit_follower("1/1/2000", barak) 
r1 = flat_2.recruit_follower("1/1/2000", tim) 
r4 = app_academy.recruit_follower("1/1/2000", f4)
r5 = app_academy.recruit_follower("1/1/2000", f5)
r6 = app_academy.recruit_follower("1/1/2000", f6)
r7 = app_academy.recruit_follower("1/1/2000", f7)
r8 = app_academy.recruit_follower("1/1/2000", f8)
r9 = app_academy.recruit_follower("1/1/2000", f9)
r10 = app_academy.recruit_follower("1/1/2000", f10)

# join_cult(initiation_date, cult)
#j1 = tim.join_cult("04/31/1999", flatiron) #add tim to flatiron
#j2 = barak.join_cult("03/15/2019", app_academy) #add barak to app academy

# cults for cartain follower
carlos_cults = carlos.cults # expect flatiron & app academy 
barak_cults = barak.cults  # expect flatiron
tim_cults = tim.cults      # expect app academy


# followers min age
min_age_18 = Follower.of_a_certain_age(18) #expect carlos & tim
min_age_35 = Follower.of_a_certain_age(35) #expect tim 
min_age_17 = Follower.of_a_certain_age(15) #expect all

# cult's number of followers 
flatiron_pop = flatiron.cult_population # expect 2
app_academy_pop = app_academy.cult_population # expect 3

# find cult by name
find_flatiron = Cult.find_by_name("Flatiron School") # expect flatiron object
find_app_academy = Cult.find_by_name("App Academy")  # expect app academy object

# find cult by location
find_nyc = Cult.find_by_location("downtown") # expect flatiron
find_nowhere = Cult.find_by_location("nowhere") # expect app academy

# find cult by fouding year
find_2011 = Cult.find_by_founding_year(2011) # expect flatiron
find_1997 = Cult.find_by_founding_year(1997) # expect app academy

# cult's followers average age
flatiron_avg = flatiron.avg_age # expect 23.5
app_academy_avg = app_academy.avg_age # expect 32

# cult followers life mottos
flatrion_mottos = flatiron.my_followers_mottos # expect 'learn love code' 'why not?'
app_academy_mottos = app_academy.my_followers_mottos # expect all 3 mottos

# least popular cult
least_popular_cult = Cult.least_popular # expect flatiron

# most common cult location
cult_location_most = Cult.most_common_location

# most active follower (max cults)
most_active_follower = Follower.most_active # expect carlos

# top 10 active followers
top10 = Follower.top_ten # expect carlos, tim/barak,f4-10, no f11

flatiron_all = flatiron.cult_followers

binding.pry


puts "Mwahahaha!" # just in case pry is buggy and exits
