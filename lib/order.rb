require_relative "menu"

class Order

  attr_reader :complete_order, :food_options

  def initialize(food_options = Menu.new.food_options)
    @complete_order = []
    @food_options = food_options
  end

  def new_item(item, quantity)
    counter = 0
    while true
    food_options.map{ |hash|
      if item == hash[:Dish]
        @complete_order << hash
        counter += 1
        break if counter == quantity
        
      end
    }


    end
  end

end
