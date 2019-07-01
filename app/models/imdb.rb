class Movie

    attr_accessor :name, :character

    @@all = []

    def initialize(name, *character)
        @name = name
        @character = character
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_actors
        max = 0
        max_name = ""
        Movie.all.each do |movie|
            if movie.character.count > max
                max += movie.character.count
                max_name = movie.name
            end
        end
        max_name
    end
end

class Show

    attr_accessor :name, :character

    @@all = []

    def initialize(name, *character)
        @name = name
        @character = character
        @@all << self
    end

    def on_the_big_screen

        Show.all.collect do |show|
            Movie.all.select {|movie| movie.name == show.name}
        end
    end

    def self.all
        @@all
    end
end

class Character

    attr_accessor :name, :actor, :show, :movie

    @@all = []

    def initialize(name, actor)
        @name = name
        @actor = actor
        @@all << self
    end

    def count_appearances
        counter = 0

        Show.all.each do |show|
            if show.character.include?(self)
                counter += 1
            end
        end

        Movie.all.each do |movie|
            if movie.character.include?(self)
                counter += 1
            end
        end
        counter
    end

    def self.most_appearances
        max = 0
        ca = ""
        Character.all.each do |character|
            if character.count_appearances > max
                max = character.count_appearances
                ca = character.name
            end
        end
        ca
    end

    def self.all
        @@all
    end
end

class Actor

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def character_count
        counter = 0

        Character.all.each do |char|
            if char.actor == self
                counter += 1
            end
        end
        counter
    end

    def self.most_characters
        max = 0
        mactor = ""
        Actor.all.each do |act|
            if act.character_count > max
                max = act.character_count
                mactor = act.name
            end
        end
        mactor
    end

    def self.all
        @@all
    end
end