class Passenger

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def drivers
        Ride.all.map do |ride|
            ride.passenger == self
            ride.driver
        end
    end

    def rides
        Ride.all.map do |ride|
            ride.passenger == self
            ride
        end
    end

    def total_distance
        total = 0

        Ride.all.map do |ride|
            ride.passenger == self
            total += ride.distance
        end

        total
    end

    def self.premium_members
        self.all.map do |passenger|
            if passenger.total_distance > 100
                passenger
            end
        end
    end

    def self.all
        @@all
    end
end

class Driver

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def passengers
        Ride.all.map do |ride|
            ride.driver == self
            ride.passenger
        end
    end

    def rides
        Ride.all.map do |ride|
            ride.driver == self
            ride
        end
    end

    def total_miles
        total = 0

        Ride.all.map do |ride|
            ride.driver == self
            total += ride.distance
        end

        total
    end

    def self.mileage_cap(distance)

        self.all.map do |driver|
            if driver.total_miles > distance
                driver
            end
        end
    end

    def self.all
        @@all
    end
end

class Ride

    attr_accessor :distance, :passenger, :driver

    @@all = []

    def initialize(distance, passenger, driver)
        @distance = distance
        @passenger = passenger
        @driver = driver
        @@all << self
    end

    def passengers
        self.passenger
    end

    def drivers
        self.driver
    end

    def self.average_distance
        sum = 0

        Ride.all.map do |ride|
            sum += ride.distance
        end

        sum / Ride.all.length
    end

    def self.all
        @@all
    end
end