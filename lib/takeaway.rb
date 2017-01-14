require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :basket
  include Menu, Order

  def initialize
    @menu = read_menu
    @basket = []
  end

  def order(item)
    @basket << add_to_order(item)
    "#{item} has been added to your basket"
  end


end
