require 'forwardable'

class Restaurant

  extend Forwardable

  def_delegator :@menu, :list_items, :menu
  #def_delegator :@query_order, :order_details, :my_order

  def initialize menu_klass=Menu, order_klass=Order
    @menu_klass = menu_klass
    @order_klass = order_klass
    @menu = @menu_klass.new
    @orders = []
  end

  def change_menu new_menu
    @menu = @menu_klass.new new_menu
  end

  def new_order order_details, customer
    @orders << @order_klass.new(order_details, customer)
  end

  def orders
    @orders.clone
  end

  def place_order
    # makes new order instance
    # fetches and returns bill from order instance
  end


end
