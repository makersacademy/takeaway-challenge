require_relative 'menu'
require_relative 'basket'
require_relative 'confirmation'

class Takeaway

  def initialize(menu = Menu.new)
    @basket = Basket.new
    @menu = menu
    @confirmation = Confirmation.new
  end

  def read_menu
    @menu.list
  end

  def order(dish, number = 1)
    fail "#{dish} is not on the menu. Sorry!" unless @menu.contain?(dish)
    fail "Order value must be more than 0" if number < 1
    @basket.add_dish(dish, number)
    puts "#{number} x #{dish} added to your order!"
  end

  def check_order
    @basket.basket.each do |key, value|
      puts "#{key} x #{value} : £#{(Menu::DISHES[key]*value)}"
    end
      puts "TOTAL : £#{total}"
  end

  def total
    @basket.total
  end

  def checkout(total)
    fail 'Please enter the correct total to checkout' if total != @basket.total
    @confirmation.send_SMS
    puts "Order complete. Confirmation on its way!"
  end

end
