require 'pry'



class Listing

    attr_accessor :name, :city

    @@all = []

    def initialize(name, city)
        @name = name
        @city = city
        @@all << self
    end

    def guests
        guest_a = []
        Trip.all.select {|trip| 
            if trip.listing == self
                guest_a << trip.guest
            end
    }
        guest_a
    end

    def trips
        Trip.all.select {|trip| trip.listing == self}
    end

    def trip_count
        self.trips.count
    end

    def self.find_all_by_city(city)
        Listing.all.select {|listing| listing.city == city}
    end

    def self.most_popular
        max = 0
        result = []

        Listing.all.each do |listing|
            if listing.trip_count > max
                max = listing.trip_count
                result = listing
            end
        end
        result
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

    def listings
        listing_array = []

        Trip.all.select do |trip| 
            if trip.guest == self
                listing_array << trip.listing
            end
        end
        listing_array.uniq
    end

    def trips
        Trip.all.select {|trip| trip.guest == self}
    end

    def trip_count
        self.trips.count
    end

    def self.pro_traveller
        array = []

        Guest.all.select do |guest|
            if guest.trip_count > 1
                array << guest.name
            end
        end
        array
    end

    def self.find_all_by_name(name)
        array = []

        Guest.all.select do |guest|
            if guest.name == name
                array << guest
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

    def initialize(listing, guest)
        @listing = listing
        @guest = guest
        @@all << self
    end

    def self.all
        @@all
    end
end
