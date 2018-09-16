require_relative 'basket'

class Menu

  def initialize
    @menu = { "chips" => 2.5, "kebab" => 5.5, "burger" => 4.75 }
    @basket = []
  end

  def display_menu
    puts @menu
  end

  def select(food_item, qty = 1)
    @basket << { food_item => qty }
    "You have added #{food_item} x#{qty} portions"
  end

  def summary
    @basket
  end

end
