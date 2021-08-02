# require "takeaway"
# require "order"

class Menu
  attr_reader :dish_list

  def initialize
    @dish_list = [
      {dish: "Margarita", price: 5},
      {dish: "Veggie", price: 6},
      {dish: "Hawaiian", price: 7},
      {dish: "Pepperoni", price: 8},
      {dish: "Calzone", price: 9}
    ]
  end  
end 