require './lib/dishes'
require './lib/menu'

class Order

  attr_reader :cust_name, :cust_number, :menu_object, :order

  def initialize(cust_name, cust_number, menu_object)
    @cust_name = cust_name
    @cust_number = cust_number
    @menu_object = menu_object
    @order = []
  end

  def add_to_order(item_name)
    raise 'Item not on menu!' if (@menu_object.menu.select { |i| i.name == item_name }) == []
    @order << @menu_object.menu.select { |i| i.name == item_name }
  end



end
