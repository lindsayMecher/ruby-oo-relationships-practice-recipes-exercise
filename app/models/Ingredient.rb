class Ingredient

    @@all = []

    attr_accessor :name
    attr_reader 

    def initialize(name)
        @name = name
        @@all << self
    end 

    def self.all 
        @@all
    end 

    def allergies
        Allergy.all.select do |allergy|
            allergy.ingredient == self
        end
    end 

    def self.allergen_hash
        hash = {} 
        self.all.each do |ingredient|
            if hash[ingredient]
                hash[ingredient] += ingredient.allergies.count
            else
                hash[ingredient] = 0
                hash[ingredient] += ingredient.allergies.count
            end 
        end 
        hash
    end 

    def self.most_common_allergen
        allergy = nil
        count = nil
        self.allergen_hash.each do |k,v|
            if count == nil || count < v
                count = v
                allergy = k
            end
        end
        allergy
    end

    
end 