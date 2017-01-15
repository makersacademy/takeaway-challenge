require_relative "menu.rb"
require_relative "dish.rb"
require_relative "menu_lister.rb"
require_relative "order.rb"
require_relative "order_total_checker.rb"

class Takeaway

  attr_reader :menu

  def initialize(menu, lister_module=MenuLister, order_class=Order, order_total_checker = OrderTotalChecker)
    @menu = menu
    @lister = lister_module
    @order_class = order_class
    @order_total_checker = order_total_checker
  end

  def show_menu
    print @lister.list(@menu)
  end

  def place_order(order)
    raise "Your expected total order cost is wrong!" unless @order_total_checker.check_total(order)
    print "Your order has been accepted, you will receive a text message confirmaton shortly!"
  end

  def new_order
    @order_class.new(@menu)
  end

end
