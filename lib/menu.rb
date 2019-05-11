require_relative 'takeaway'

class Menu

  attr_reader :items

  def initialize
   @items = [
      { "dish_one" => 2 },
      { "dish_two" => 4 },
      { "dish_three" => 12 },
      { "dish_four" => 15 }
    ]
  end

  # def display
  #   @items
  # end

end


  # attr_reader :items, :dish, :price
  #
  # def initialize(dish = "carrot cake", price = 2)
  #   @items = {}
  #   @dish = dish
  #   @price = price
  # end




  #
  # def items
  #   thing_one = {"dish" => :dish, "price" => :price}
  #   thing_two = {"dish" => :dish, "price" => :price}
  #   thing_three = {"dish" => :dish, "price" => :price}
  # end
