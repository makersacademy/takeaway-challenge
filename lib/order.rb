require_relative 'menu'
require_relative 'basket'
require_relative 'notifier'

class Order

  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Basket.new
    @notifier = Notifier.new
  end

  def place_an_order(dish, qnty)
    fail 'Item is not listed in the menu' if !@menu.menu.has_key? dish
    @basket.basket[dish].nil? ? @basket.basket[dish] = qnty : @basket.basket[dish] += qnty
    added_to_basket(dish, qnty)
  end

  def display_basket
    @basket.display_basket
  end


  def total
    price = @basket.basket.map{|k,v| @basket.basket[k] * @menu.menu[k]}
    @total_price = price.inject(&:+).round(2)
    display_total
  end

  def complete(price)
    fail "The sum is incorrect" if !correct_price? price
    msg = "Thank you! Your order was placed and will be delivered before #{plus_hour_time}"
    @notifier.send_msg(msg)
    @basket.basket = {}
  end

  private

  def correct_price?(price)
    price == @total_price
  end

  def added_to_basket(dish, qnty)
    "<#{dish} x #{qnty} x £#{@menu.menu[@dish]}0> added to your basket"
  end

  def display_total
    "Total is £#{@total_price}0"
  end

  def plus_hour_time
   (Time.now + 3600).strftime("%H:%M")
  end
end
