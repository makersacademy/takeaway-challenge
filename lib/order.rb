# require_relative 'menu'

class Order
  MENU_OPTIONS = {
        "jollof rice": { price: 6 },
        "fried plantain": { price: 3 },
        "jerk chicken": { price: 8 },
        "vegetable patty": { price: 4.5 },
        "ice cream": { price: 4 }
      }
  
  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def print_menu
    MENU_OPTIONS
  end

  def add_item(item, quantity)

  end
  # binding.pry
end
