require_relative 'menu'
require_relative 'takeaway_errors'

class Order
  attr_reader :basket, :menu, :total

  MIN_QUANTITY = 1

  def initialize(menu)
    @menu = menu.items
    @basket = {}
    @total = 0
  end

  def add_item(item, quantity) 
    raise InvalidSelectionError if invalid_selection?(item) 
    raise ZeroQuantityError if zero_quantity?(quantity)
    
    @basket[item.capitalize] = quantity 
  end

  def calculate_total
    @basket.each do |item, quantity|
      @total += (quantity * @menu[item])
    end
    @total
  end

  def calculate_quantity_total(item)
    @menu[item] * @basket[item]
  end

  private 

  def invalid_selection?(item)
    @menu[item.capitalize].nil?
  end

  def zero_quantity?(quantity)
    quantity < MIN_QUANTITY
  end
end
