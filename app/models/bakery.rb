class Bakery

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
    end

    # def add_dessert

    # end

    def ingredients
        list = []
        Dessert.all.select do |dessert|
            if dessert.bakery == self
                list << dessert.ingredient
            end
        end
        list
    end

    def desserts
        Dessert.all.select do |dessert|
            dessert.bakery == self
        end
    end

    def average_calories

    end

    def shopping_list

    end

    def self.all
        @@all
    end
end

class Dessert

    attr_accessor :name, :bakery, :ingredients

    @@all = []

    def initialize(name, bakery)
        @name = name
        @bakery = bakery
        @ingredients = []
        @@all << self
    end

    def self.all
        @@all
    end
end

class Ingredient

    attr_accessor :calorie_count, :dessert
    
    @@all = []

    def initialize(calorie_count, dessert)
        @calorie_count = calorie_count
        @dessert = dessert
        @@all << self
    end

    def dessert
        Ingredient.all.select
    end

    def bakery
        Dessert.all.select do |d|
            if d.ingredients.include?(self)
                d.bakery
            end
        end
    end

    def self.find_all_by_name(string)
        Ingredients.all.select {|ingredient| ingredient.name.include?(string)}
    end

    def self.all
        @@all
    end
end