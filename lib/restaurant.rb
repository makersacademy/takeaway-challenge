require 'forwardable'

class Restaurant

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

  def place_order customer, order_details
    @orders << new_order(customer, menu, order_details)
    if customer.bill_correct? self
      "Thank you for your custom. Your total is $#{customer.restaurant_bill}. Your order will be delivered at #{Time.now + 3600}"
    else
      fail "Bill incorrect. Please check order"
    end
  end

  def orders
    @orders.clone
  end

end
