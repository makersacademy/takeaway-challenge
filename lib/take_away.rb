require_relative 'order'

class TakeAway
  def initialize(order_class: Order)
    @order_class = order_class
  end

  def new_order(customer)
    @order = @order_class.new(customer)
  end

  def show_menu
    @order.show_menu
  end

  def show_order
    @order.order
  end

  def order_item(item, quantity)
    @order.add_to_order(item, quantity)
  end

  def get_bill
    @order.bill_total
  end
end
