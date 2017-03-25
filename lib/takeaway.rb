require_relative 'menu'
require_relative 'order'

class TakeAway

  attr_reader :basket, :menu, :order

  def initialize
    @basket = []
    @menu = Menu.new
  end

  def read_menu
    menu.dishes
  end

  def add(item, quantity = 1)
    @order = Order.new(menu)
    quantity.times { basket << order.add(item) }
    puts "#{quantity}x #{item} added to your basket."
  end

  def total
    order.nil? ? total=0.00 : total=order.calc(basket)
    puts "Total: £#{total}"
    total
  end

end
