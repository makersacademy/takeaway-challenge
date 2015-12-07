require_relative 'menu'
require_relative 'message'
require_relative 'order'

class Takeaway
attr_reader  :name, :tel, :address, :menus, :orders

  def initialize(name, tel, address)
    @name = name
    @tel = tel
    @address = address
    @menus = []
    @orders = []
  end

  def create_menu(menu = Menu.new)
    menu.itemised
    @menus << menu
    @menu
  end

  def delete_menu(menu)
    @menus.delete(menu)
  end

  def create_order(name,house_no,street,postcode,mobile_no)
    @order = Order.new(name,house_no,street,postcode,mobile_no)
    @orders << @order
  end

  def delete_order(order_no)
    @orders.delete(order_no)
  end

  def finalise_order(order)
   empty_cart?(order)
   total_check(order)
   order.completed = true
   confirmation_message(order)
  end

  private

  def confirmation_message(order)
    Message.new.send(order.mobile_no,order.name)
  end

  def total_check(order)
    check_total = 0
    order.cart.each{|x,y| check_total += (x[1].gsub(/[^\d,\.]/, '').to_f * y)}
    fail 'Total doesnt match itemised total' if check_total != order.total
  end

  def empty_cart?(order)
    fail 'Cart empty' if order.cart.empty? || order.total <= 0
  end
end
