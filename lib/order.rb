require_relative "menu"
require_relative "sms"
require_relative "time"
require_relative "basket"

class Order

attr_reader :full_menu, :basket, :total

def initialize
  @full_menu = Menu.new
  @basket=Basket.new
  @time=Time.new
end

def view_menu
 @full_menu.print_menu
end

def add_dish(number, quantity)
  raise "Sorry that dish isn't available" if @full_menu.menu.length < (number-1)
  @basket.in_basket(number, quantity)
end


def show_order
  @basket.open_basket
end

def total_price
  @basket.sum_basket
end

def place_order
  message = Sms.new
  message.send_text("Thank you! Your order was placed and will be delivered before #{@time.time}")
end


end
