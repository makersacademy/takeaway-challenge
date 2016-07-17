require_relative 'order'

class Customer
  attr_reader :name, :address, :phone, :order

  def initialize(name, address, phone)
    @name = name
    @address = address
    @phone = phone
  end

  def new_order(restaurant)
    @order = Order.new(self, restaurant)
  end

  def view_menu
    check_restaurant
    @order.show_menu
  end

  def order_item(item, quantity)
    check_restaurant
    @order.add_to_order(item, quantity)
  end

  def view_order
    check_restaurant
    @order.show_order
  end

  def complete_order
    check_restaurant
    @order.complete_order
    @order = nil
  end

  private
  def check_restaurant
    raise "No restaurant chosen, try ordering a takeaway first" if @order.nil?
  end
end
