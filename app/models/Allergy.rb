class Allergy

    @@all = []

    attr_accessor :ingredient, :user, :severity
    attr_reader 

    def initialize(ingredient, user, severity)
        @ingredient = ingredient 
        @user = user
        @severity = severity
        @@all << self
    end 

    def self.all 
        @@all
    end 


end 