require_relative 'menu'
require_relative 'remainder'


class Takeaway


  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
    @reminder = Reminder.new
  end

  def place_an_order(dish, qnty = 1)
    fail 'Item is not listed in the menu' if !@menu.menu.has_key? dish
   @basket[dish].nil? ? @basket[dish] = qnty : @basket[dish] += qnty

    "<#{dish} x #{qnty} x £#{@menu.menu[dish]}0> added to your basket"
  end

  def basket
    message = "Items in your basket:"
    "#{@basket.each{|k,v| puts "#{message} #{k} x #{v} x £#{@menu.menu[k]}0"}}"
  end

  def total
    price = @basket.map{|k,v| @basket[k] * @menu.menu[k]}
    @total_price = price.inject(&:+).round(2)
    "Total is £#{@total_price}0"
  end


def complete(price)
  fail "The sum is incorrect" if !correct_price? price
  time = (Time.now + 3600).strftime("%H:%M")
  msg = "Thank you! Your order was placed and will be delivered before #{time}"
  @reminder.send_msg(msg)
end

private

def correct_price?(price)
  price == @total_price
end

end
