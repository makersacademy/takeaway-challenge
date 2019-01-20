require_relative 'menu'

class Basket
  attr_reader :basket
  MINIMUM_ITEM_CODE = 1
  MAXIMUM_ITEM_CODE = 10

  def initialize
    @basket = []
    @menu = Menu.new
  end

  def add_to_basket(item_code, quantity = 1)
    fail "Please enter a valid item code." if item_code.is_a? String
    fail "Please enter a valid item code." if item_code < MINIMUM_ITEM_CODE
    fail "Please enter a valid item code." if item_code > MAXIMUM_ITEM_CODE
    quantity.times do
      @basket << @menu.menu[item_code - 1]
    end
    chosen_item = @menu.menu[item_code -1][:item]
    "#{quantity} #{chosen_item} added to basket"
  end

  def remove_from_basket(item_code)

  end

end
