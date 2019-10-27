require_relative "menu"
require_relative "payment"
class Restaurant

  attr_reader :menu, :order, :grand_total

  def initialize
    @order = []
  end

  def load_menu(menu = Menu.new)
    @menu = menu
  end

  def choose(dish, quantity)
    quantity.times do
      @menu.dishes.select {|k, v| @order.push([k, v]) if k == dish }
    end
    puts "You ordered #{quantity} #{dish}"
    @order
  end

  def total
    grand_total = @order.map {|arr| arr[1]}.sum
    "Your total order will cost #{grand_total}"
  end

  def pay(payment = Payment.new)
    @payment = payment
  end

end
