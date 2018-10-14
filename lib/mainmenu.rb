require_relative 'menu'
require_relative 'send_sms'
require_relative 'order'

class MainMenu

  def initialize
    @menu = Menu.new
    @new_order = Order.new
    @sms_new = SMS.new
  end

  def print_header
    puts "Welcome to the Makers Cafe!"
  end

  def view_menu
    @menu.view
  end

  def place_order
    @new_order.place_an_order
  end

  def confirm_order
    puts "Your order has been confirmed, an SMS confirmation is on its way."
    @sms_new.send_sms
  end

  def front_menu
    puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    puts "1. View the menu"
    puts "2. Place an order"
    puts "3. Confirm your order"
    puts "4. Exit"
    puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-"
  end

  def process(selection)
    case selection
    when "1"
      view_menu
    when "2"
      place_order
    when "3"
      confirm_order
    when "4"
      exit
    else puts "Sorry try again."
    end
  end

  def interative_menu
    print_header
    loop do
      front_menu
      process(gets.chomp)
    end
  end

end

# test = MainMenu.new
# test.interative_menu
