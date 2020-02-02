require 'menu'

class Order
  include Menu
  attr_reader :dish, :quantity, :cost

  def initialize(item_no, quantity = 1)
    @dish = MENU[item_no][:dish]
    @quantity = quantity
    @cost = MENU[item_no][:cost] * quantity
  end
end