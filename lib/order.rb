require 'menu'

class Order
  include Menu
  attr_reader :dish

  def initialize(item_no)
    @dish = MENU[item_no][:dish]
  end
end