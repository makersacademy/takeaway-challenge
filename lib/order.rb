require_relative 'menu'
require_relative 'takeaway_errors'

class Order
  attr_reader :basket, :menu

  def initialize(menu)
    @menu = menu.items
    @basket = {}
  end

  def add_item(item, quantity) 
    raise InvalidSelectionError if invalid_selection?(item) 
    raise ZeroQuantityError if zero_quantity?(quantity)
    
    @basket[item.capitalize] = quantity 
  end

  def calculate_total
    total = 0
    @basket.each do |item, quantity|
      total += (quantity * @menu[item])
    end
    total
  end

  private 

  def invalid_selection?(item)
    @menu[item.capitalize] == nil
  end

  def zero_quantity?(quantity)
    quantity == 0
  end
end
