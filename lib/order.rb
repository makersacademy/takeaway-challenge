require 'menu'

class Order
  include Menu
  attr_reader :dish, :quantity

  def initialize(item_no, quantity = 1)
    @dish = MENU[item_no][:dish]
    @quantity = quantity
  end
end