require_relative 'menu'
require_relative 'takeaway'

class Order

  attr_reader :price ,:order_total

  def initialize(menu = Menu.new)
    @ordered_items = {}
    @menu_items = menu.list
  end

  def calc_price(ordered_items)
    @ordered_items = ordered_items
    temp_sum = @ordered_items.map{|k,v| v * @menu_items[k] if @menu_items.key? k }.compact
    order_total = temp_sum.inject(0, :+)
  end

  

end






# a = ["Item1","Item5"]
#
#  b = {"Item1" => 2, "Item3" => 3, "Item5" => 4 , "Item6" =>5}
#
#
#  a.map{|item|b.select{|k,v| k == item}}


# a = {"Dal Tadka" => 2, "Rice" => 2}
# c = {"Dal Tadka" => 2.00, "Rice" => 4.00. "Naan" => 3.00}
#
#
#
#  a.map { |k, v| v * c[k] if c.key? k }.compact
