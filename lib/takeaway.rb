require_relative 'menu'
require_relative 'order'

class TakeAway

  attr_reader :basket, :menu, :new_order

  def initialize
    @basket = []
    @menu = Menu.new
    @new_order = Order.new(menu)
  end

  def read_menu
    menu.dishes
  end

  def order(item, quantity=1)
    quantity.times do
      basket << new_order.add(item)
    end
    puts "#{quantity}x #{item}(s) added to your basket."
  end

  def total
    new_order.calculate_total(basket)
  end

  private
end
