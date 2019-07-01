require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

alex = Driver.new("Alex")
amin = Passenger.new("Amin")
fr = Ride.new(5.0, amin, alex)
sr = Ride.new(600.0, amin, alex)

Pry.start

