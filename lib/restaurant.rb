require_relative 'customer'

class Restaurant

  attr_reader :menu

  def initialize
    @menu = [
      { "Breadsticks" => 0.99 },
     { "Steak" => 23 },
     { "Lasagna" => 14 },
     { "Butter Chicken Rice" => 11 },
     { "Spaghetti" => 12 },
     { "Mango Sorbet" => 3 },
     { "BBQ Beef" => 18 },
     { "Stir Fry" => 14.50 },
     { "Salad" => 6.50 },
     { "Cocktail" => 4.50 }
    ]
  end

  
end