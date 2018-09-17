 require_relative './orderlist.rb'
 require_relative './menulist.rb'
 require_relative './delivery.rb'
# handles customer orders

class Order
  def initialize(menu = MenuList.new,
                 orderlist = OrderList.new,
                 delivery = Delivery.new)
    @menu = menu.list_menu
    @orderlist = orderlist
    @delivery = delivery
    @err_message = "No orders yet!"
  end

  def add(index)
    orderlist.store_order(menu[index])
  end

  def show_orders
    raise err_message unless no_orders?
    format_list(orderlist.orders)
  end

  def show_menu
    format_list(menu)
  end

  def show_cost
    raise err_message unless no_orders?
    orderlist.stringify_cost
  end

  def place_order
    raise err_message unless no_orders?
    delivery.send_sms
  end

  private
  attr_reader :delivery, :orderlist, :menu, :err_message

  def format_list(list)
    list.map do |dish|
      puts "#{dish[:order_num]}. #{dish[:name]}, price: £#{"%.2f" % dish[:price]}\n"
    end
  end

  def no_orders?
    orderlist.orders.length > 0
  end
end
