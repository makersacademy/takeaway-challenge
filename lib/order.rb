require_relative "menu"

class Order
  attr_reader :basket
  UNAVAIABLE_ERROR = "Item not available."

  def initialize(menu)
    @menu = menu
    @basket = Hash.new(0)
  end

  def add(item, quantity = 1)
    raise UNAVAIABLE_ERROR unless available?(item)
    @basket[item] += quantity
  end

  private
    def available?(item)
      @menu.display.include? item
    end
end
