require_relative 'menu'
require_relative 'order'

class TakeAway

  attr_reader :basket, :menu, :new_order

  def initialize
    @basket = []
    @menu = Menu.new
  end

  def read_menu
    menu.dishes
  end

  def order(item, quantity=1)
    @new_order = Order.new(menu)
    quantity.times { basket << new_order.add(item) }
    puts "#{quantity}x #{item}(s) added to your basket."
  end

  def total
    if new_order.nil?
      0.00
    else
      new_order.calculate_total(basket)
    end
  end

end
