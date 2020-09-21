class User

    @@all = []

    attr_accessor :name
    attr_reader 

    def initialize(name)
        @name = name
        @@all << self
    end 

    def recipe_cards 
        RecipeCard.all.select do |rc|
            rc.user == self
        end 
    end

    def recipes 
        self.recipe_cards.map do |rc|
            rc.recipe
        end 
    end

    def add_recipe_card(recipe, rating)
        RecipeCard.new(recipe, self, rating)
    end 

    def declare_allergy(ingredient, severity) 
        Allergy.new(ingredient, self, severity)
    end

    def allergies 
        Allergy.all.select do |all|
            all.user == self
        end
    end 
    
    def allergens
        self.allergies.map do |allergy|
            allergy.ingredient
        end 
    end 

    def top_three_recipes 
        sorted = self.recipe_cards.sort_by do |rc|
            rc.rating
        end 
        sorted.reverse[0..2]
    end 

    def most_recent_recipe
        sorted = self.recipe_cards.sort_by do |rc|
            rc.date
        end 
        sorted.last
    end 

    def safe_recipes 
        # should return all recipes that do not contain ingredients the user is allergic to
        safe_recipe_ingredients = RecipeIngredient.all.select do |recipe_ingredient|
            !self.allergens.include(recipe_ingredient.ingredient)
        end
        binding.pry
    end 

    def self.all 
        @@all
    end 

    
end 