require 'pry'



class Listing

    attr_accessor :name, :city

    @@all = []

    def initialize(name, city)
        @name = name
        @city = city
        @@all << self
    end

    def guests(listing)
        guest_array = []
        Trip.all.select {|trip| 
        if trip.listing == listing
            guest_array << trip.guest
        end
        }
        guest_array
    end

    def trips(listing)
        Trip.all.select {|trip| trip.listing == listing}
    end

    def trip_count
        Trip.all.select {|trip| trip.listing == listing}.count
    end

    def self.find_all_by_city(city)
        Listing.all.select {|listing| listing.city == city}
    end

    def self.most_popular
        Trip.all.max_by {|trip| Trip.all.count(trip)}
    end

    def self.all
        @@all
    end
end


class Guest

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def listings(name)
        listing_array = []

        Trip.all.select do |trip| 
            if trip.guest == name
                listing_array << trip.listing
            end
        end
        listing_array
    end

    def trips(name)
        Trip.all.select {|trip| trip.guest == name}
    end

    def trip_count(name)
        Trip.all.select {|trip| trip.guest == name}.count
    end

    def self.pro_traveller
        array = []

        Guest.all.select do |x|
            if trip_count(x.name) > 1
                array << x.name
            end
        end
        array
    end

    def self.find_all_by_name(name)
        array = []

        Guest.all.select do |x|
            if x.name == name
                array << name
            end
        end
        array
    end

    def self.all
        @@all
    end
end


class Trip

    attr_accessor :listing, :guest

    @@all = []

    def initialize(listing,guest)
        @listing = listing
        @guest = guest
        @@all << self
    end

    def listing
        @listing
    end

    def guest
        @guest
    end

    def self.all
        @@all
    end
end
