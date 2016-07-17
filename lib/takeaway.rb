require_relative 'menu'

class Takeaway

def initialize(menu = Menu.new)
  @menu = menu
  @basket = {}
end

def place_an_order(dish, qnty = 1)
    fail 'Item is not listed in the menu' if !@menu.menu.has_key? dish
   @basket[dish].nil? ?   @basket[dish] = qnty : @basket[dish] += qnty

    "<#{dish} x #{qnty} x £#{@menu.menu[dish]}0> added to your basket"
end

  def basket
    message = "Items in your basket:"
    "#{@basket.each{|k,v| puts "#{message} #{k} x #{v} x £#{@menu.menu[k]}0"}}"
  end

  def total
    price = @basket.map{|k,v| @basket[k] * @menu.menu[k]}
    "Total is £#{price.inject(&:+).round(2)}0"
  end

end
