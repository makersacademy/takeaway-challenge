require 'menu'
require 'order'
#sends completed orders to the customer
class Takeaway

  def initialize(menu = @menu, order = nil)
    @menu = menu
    @order = order || Order.new
  end

  def completed_order

  end
end
