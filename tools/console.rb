require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# # helps with lyft.rb
# alex = Driver.new("Alex")
# amin = Passenger.new("Amin")
# fr = Ride.new(5.0, amin, alex)
# sr = Ride.new(600.0, amin, alex)

# # helps with imdb.rb
# jw = Actor.new("Jeffrey Wright")
# erw = Actor.new("Evan Rachel Wood")
# jl = Actor.new("JLaw")

# katniss = Character.new("Katniss", jl)
# bernard = Character.new("Bernard", jw)
# bt = Character.new("Beetee", jw)
# dolores = Character.new("Dolores", erw)

# dolores.show = "Westworld"
# bernard.show = "Westworld"
# katniss.movie = "Hunger Games"
# bt.movie = "Hunger Games"
# # mary = Character.new("Mary",erw)
# # jack = Character.new("Jack",jw)

# ww = Show.new("Westworld", bernard, dolores)
# ogs = Show.new("OG", bernard)
# hg = Movie.new("Hunger Games", bernard, katniss)
# ogm = Movie.new("OG",bernard)

# helps with crowdfunding.rb
amin = User.new("Amin")
alex = User.new("Alex")
tyler = User.new("Tyler")

environment = Project.new("Environment",tyler,5)
library = Project.new("Library",amin,10)
commcenter = Project.new("Community Center",alex,15)
np = Project.new("no pledge project",amin,20)

Pledge.new(environment,5.0,amin)
Pledge.new(library,6.0,alex)
Pledge.new(commcenter,7.0,tyler)
Pledge.new(library,9.0,tyler)

Pry.start

