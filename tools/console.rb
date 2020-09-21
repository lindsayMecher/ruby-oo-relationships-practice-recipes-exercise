require_relative '../config/environment.rb'



100.times do 
    Recipe.new(Faker::Food.dish)
end 

100.times do 
    Ingredient.new(Faker::Food.ingredient)
end

100.times do 
    User.new(Faker::Movies::HarryPotter.character)
end

nums = (1..5).to_a

100.times do 
    Allergy.new(Ingredient.all.sample, User.all.sample, nums.sample)
end

100.times do 
    RecipeCard.new(Recipe.all.sample, User.all.sample, nums.sample)
end

100.times do 
    RecipeIngredient.new(Recipe.all.sample, Ingredient.all.sample)
end




binding.pry
