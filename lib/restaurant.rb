require 'forwardable'
require 'send_sms'

class Restaurant

  include SMS
  extend Forwardable

  def_delegator :@menu, :list_items, :menu
  def_delegator :@order_klass, :new, :new_order

  def initialize menu_klass=Menu, order_klass=Order
    @menu_klass = menu_klass
    @order_klass = order_klass
    @menu = @menu_klass.new
    @orders = []
  end

  def change_menu new_menu
    @menu = @menu_klass.new new_menu
  end

  def orders
    @orders.clone
  end

  def place_order customer, order_details
    @orders << new_order(customer, menu, order_details)
    fail "Bill incorrect. Please check order" unless customer.bill_correct? self

    message = "Thank you for your custom, #{customer.name}. Your total is $#{customer.restaurant_bill}. Your order will be delivered at #{Time.now + 3600}"

    send_confirmation_sms customer.tel_no, message

    "Sent order confirmation to #{customer.name}"
  end

end
