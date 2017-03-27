require_relative 'order'
require_relative 'sms'

class Takeaway

  attr_reader :order

  def initialize
    @menu = Menu.new
    @order = Order.new
    @sms = SMS.new
  end

  def view_menu
    menu.view
  end

  def place_order
    puts "Please input the menu number of the dish you would like:"
    dish_number = $stdin.gets.chomp
    puts "How many portions of this dish would you like?"
    quantity = $stdin.gets.chomp
    order.add(dish_number, quantity)
  end

  def review
    puts "======================="
    order.review
    puts "======================="
    puts "Total: £#{order.total}"
    puts "======================="
  end

  def confirm
    sms.send
  end

  private

  attr_reader :menu, :sms

end
