require_relative 'menu'
require_relative 'basket'
require_relative 'confirmation'

class Takeaway

  def initialize(menu = Menu.new, confirmation = Confirmation.new)
    @basket = Basket.new
    @menu = menu
    @confirmation = confirmation
  end

  def read_menu
    @menu.list
  end

  def order(dish, number = 1)
    fail "#{dish} is not on the menu. Sorry!" unless @menu.contain?(dish)
    fail "Order value must be more than 0" if number < 1
    confirm_order(dish, number)
  end

  def check_order
    @basket.list
    puts "TOTAL : £#{'%.2f' % @basket.total}"
  end

  def total
    puts "£" + '%.2f' % @basket.total
  end

  def checkout(payment)
    fail 'Please enter the correct payment total' if payment != @basket.total
    fail 'Please order before checking out..' if @basket.total == 0
    confirm_checkout
    @basket.empty
  end

  private

  def confirm_order(dish, number)
    @basket.add_dish(dish, number)
    puts "#{number} x #{dish} added to your order!"
  end

  def confirm_checkout
    @confirmation.send_sms
    puts "Order complete. Confirmation on its way!"
  end

end
