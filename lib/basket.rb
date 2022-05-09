require_relative 'menu'
require_relative 'notifier'
class Basket
  attr_reader :basket, :menu, :total
  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
  end

  def add(item, quantity)
    @menu.items.select { |dish| @basket[item] = quantity if dish == item }
  end

  def show_basket
    basket = []
    @basket.each { |item, quantity| basket << "#{item} x #{quantity}" }
    basket.join(", ")
  end

  def checkout
    checkout = []
    @basket.each { |item, quantity| checkout << @menu.items[item] * quantity }
    "The total cost will be £#{checkout.sum}"
  end

  def order_confirmation(notifier = Notifier.new)
    notifier.send_message("Your order is on it's way!")
  end

end
