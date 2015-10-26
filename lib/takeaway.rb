require_relative 'order'
require_relative 'menu'
require_relative 'sms'

class Takeaway
  extend Forwardable

  def_delegator :@order, :add, :add

  WRONG_TOTAL_ERROR = 'Order total incorrect, please try again'

  def initialize(order_klass = Order, menu_klass = Menu, sms_klass = Sms)
    @order = order_klass.new
    @menu = menu_klass.new
    @sms = sms_klass.new
  end

  def list_dishes
    @menu.formatted_dishes
  end

  def add_to_order(dish_num, quantity)
    dish = @menu.dishes[dish_num]
    add(dish, quantity)
  end

  def place_order(total)
    fail WRONG_TOTAL_ERROR unless total == @order.total
    order_success
  end

  private

  def order_success
    @sms.send(@order.receipt)
  end

end
