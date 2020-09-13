require_relative 'order'

class Menu
  
  MEALS = { "pizza" => 6.99, "noodles" => 4.99, "ice cream" => 3.99 }
  attr_reader :meals, :order, :quantity

  def view
    MEALS
  end

end