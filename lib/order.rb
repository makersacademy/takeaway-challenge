require './lib/menulist.rb'
require './lib/orderlist.rb'
#handles customer orders

class Order
  attr_reader :menu, :orderlist
  def initialize(menu = MenuList.new, orderlist = OrderList.new)
    @menu = menu.get_menu
    @orderlist = orderlist
  end

  def add(index)
    orderlist.store_order(menu[index])
  end

  def show_order
    format_list(orderlist.show_orders)
  end

  def show_menu
    format_list(menu)
  end

  private

  def format_list(list)
    list.each do |dish|
       puts "#{dish[:order_num]}. #{dish[:name]}, price: £#{ "%.2f" % dish[:price]}\n"
    end
  end

end

 # require './lib/order.rb'
