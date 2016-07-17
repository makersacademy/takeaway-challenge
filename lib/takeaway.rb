require_relative 'menu'

class Takeaway

def initialize(menu = Menu.new)
  @menu = menu
  @basket = {}
end



def place_an_order(dish, qnty = 1)
    fail 'Item is not listed in the menu' if !@menu.menu.has_key? dish
    @basket[dish] = qnty
    "<#{dish} x #{qnty} x £#{@menu.menu[dish]}0> added to your basket"
end

  def basket
    message = "Items in your basket:"
    "#{message} #{@basket.each{|k, v| puts "#{k} - #{v} pcs"}}}"
  end
end
