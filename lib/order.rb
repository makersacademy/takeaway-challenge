 require_relative './orderlist.rb'
 require_relative './menulist.rb'
 require_relative'./delivery.rb'
#handles customer orders

class Order
  def initialize(menu = MenuList.new, orderlist = OrderList.new, delivery = Delivery.new)
    @menu = menu.get_menu
    @orderlist = orderlist
    @delivery = delivery
  end

  def add(index)
    orderlist.store_order(menu[index])
  end

  def show_orders
    format_list(orderlist.orders)
  end

  def show_menu
    format_list(menu)
  end

  def place_order
    delivery.send_sms
  end

  private
  attr_reader :delivery, :orderlist, :menu

  def format_list(list)
    list.map do |dish|
       puts "#{dish[:order_num]}. #{dish[:name]}, price: £#{ "%.2f" % dish[:price]}\n"
    end
  end
end

order = Order.new()
order.show_menu
order.add(2)
order.add(2)
order.show_orders
order.place_order


 # require './lib/order.rb'
