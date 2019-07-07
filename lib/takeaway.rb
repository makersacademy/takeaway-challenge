require_relative 'order'
require 'twilio-ruby'

class TakeAway

  MENU = { hamburger: 4,
         hotdog: 3,
         pizza: 5,
         fried_chicken: 3
         }
  def initialize(order_class = Order)
    @order_class = order_class
  end

  def view_dishes
    MENU.map do |x, y|
      "#{x.to_s.split('_').join(' ').capitalize} £#{y}"
    end.join(', ')
  end

  def create_new_order
    @order = @order_class.new
  end

  def add(item, amount = 1)
    @order.add(item, amount)
  end

  def basket_summary
    @order.summary
  end

  def view_order
    @order
  end

  def total
    @order.total
  end

  def checkout
    @order.checkout
  end

end

# takeaway = TakeAway.new
# p takeaway.view_dishes
# takeaway.order('pizza', 2)
# p takeaway.total
# p takeaway.basket_summary
