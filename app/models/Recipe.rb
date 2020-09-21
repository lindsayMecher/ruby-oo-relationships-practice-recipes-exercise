class Recipe

    @@all = []

    attr_accessor :name
     

    def initialize(name)
        @name = name
        @@all << self
    end 

    def recipe_cards 
        RecipeCard.all.select do |rc|
            rc.recipe == self
        end 
    end 

    def users 
        self.recipe_cards.map do |rc|
            rc.user
        end 
    end 

    def recipe_ingredients
        RecipeIngredient.all.select do |ri|
            ri.recipe == self
        end
    end 

    def ingredients
        self.recipe_ingredients.map do |ri|
            ri.ingredient
        end  
    end 

    def allergens
        # return all ingredients in this recipe that user's have allergies to.

    end 

    def add_ingredients(arr_of_ingredients)
    end 

    def self.all 
        @@all
    end 

    def self.most_popular 
        # return instance with most recipe cards
        sorted = self.all.sort_by do |recipe|
            recipe.recipe_cards.length
        end
        sorted.last
    end 



    
end 