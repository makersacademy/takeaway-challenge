require_relative 'menu'
require_relative 'order'
require_relative 'message'

#takeaway system user interface
class TakeAway

  attr_reader :basket, :menu, :order, :message

  def initialize
    @basket = []
    @menu = Menu.new
  end

  def view_menu
    menu.view
  end

  def add(item, quantity = 1)
    @order = Order.new(menu)
    quantity.times { basket << order.add(item) }
    item_added(item, quantity)
  end

  def total
    order.nil? ? total=0.00 : total=order.calc(basket)
    puts "Total: £#{total}"
    @total = total
  end

  def checkout(amount)
    fail "Checkout total incorrect" if !price_correct?(amount)
    Message.new
  end

  private

  def item_added(item, quantity)
    puts "#{quantity}x #{item} added to your basket."
    basket
  end

  def price_correct?(amount)
    amount == total
  end

end
