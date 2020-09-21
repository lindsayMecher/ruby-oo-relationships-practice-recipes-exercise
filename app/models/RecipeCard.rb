class RecipeCard

    @@all = []

    attr_accessor :recipe, :user, :rating 
    attr_reader :date

    def initialize(recipe, user, rating)
        @recipe = recipe 
        @user = user
        @rating = rating 
        @date = Time.now
        @@all << self
    end 

    def self.all 
        @@all
    end 

    
end 