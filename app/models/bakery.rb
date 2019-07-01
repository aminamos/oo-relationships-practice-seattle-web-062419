class Bakery

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
    end

    def ingredients
        Bakery.desserts.select do |dessert|
            dessert.ingredients
        end
    end

    def desserts

    end

    def average_calories

    end

    def self.all
        @@all
    end

    def shopping_list

    end
end

class Desserts

    @@all = []

    def initialize(name,bakery, *ingredients)
        @name = name
        @bakery = bakery
        @@all << self
    end

    def ingredients
        Desserts.all.select do |dessert|
            dessert.ingredients
        end
    end

    def bakery
        
    end

    def calories
        
    end

    def self.all
        @@all
    end
end

class Ingredients
    
    @@all = []

    def initialize(calorie_count, dessert)
        @calorie_count = calorie_count
        @dessert = dessert
        @@all << self
    end

    def dessert(ingredient)
        Dessert.all.select do |edessert|
            edessert.ingredients == ingredient
        end
    end

    def bakery(ingredient)
        Dessert.all.select do |edessert|
            if edessert.ingredients == ingredient
                edessert.bakery
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