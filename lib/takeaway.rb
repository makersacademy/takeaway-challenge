require_relative 'menu'
require_relative 'basket'
require_relative 'confirmation'

class Takeaway

  ERROR = {
      no_dish: "Not on the menu. Sorry!",
      zero_order: "Order value must be more than 0",
      wrong_total: 'Please enter the correct payment total',
      no_order: 'Please order before checking out..'
    }.freeze

  def initialize(menu = Menu.new, confirmation = Confirmation.new)
    @basket = Basket.new
    @menu = menu
    @confirmation = confirmation
  end

  def read_menu
    @menu.list
  end

  def order(dish, number = 1)
    fail ERROR[:no_dish] unless @menu.contain?(dish)
    fail ERROR[:zero_order] if number < 1
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
    fail ERROR[:wrong_total] if payment != @basket.total
    fail ERROR[:no_order] if @basket.total == 0
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
