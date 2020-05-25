require_relative 'menu'
require_relative 'order'
require_relative 'basket'
require_relative 'checkout'

class TakeAway
  def initialize(menu = Menu.new, order = Order.new, checkout = Checkout.new)
    @menu = menu
    @order = order
    @checkout = checkout
    @customer_order = {}
  end

  MENU_OPTIONS = {
    "> To see the takeaway menu enter:": "'menu'",
    "> To place an order enter:": "'order'",
    "> To see your basket enter:": "'basket'",
    "> To checkout your order enter:": "'checkout'",
    "> To exit hit Return": ""
  } 

  def start
    header
    loop do
      line_break
      print_options
      process(gets.chomp)
    end
  end

  private

  def header
    puts "WELCOME, PLEASE ENTER ONE OF THE FOLLOWING:"
  end

  def line_break
    puts "~" * 45
  end

  def print_options
    MENU_OPTIONS.each { |option, input| puts option.to_s.ljust(35, ' ') + input.rjust(10, ' ') }
  end

  def process(selection)
    case selection
    when "menu" then menu
    when "order" then order
    when "basket" then basket
    when "checkout" then checkout
    when "" then exit
    else invalid_entry_error
    end
  end

  def menu
    @menu.show_menu
  end

  def order
    @customer_order = @order.request_order
  end

  def basket
    @basket = Basket.new(@customer_order)
    @basket.show_basket
  end

  def checkout
    @checkout.place_order
  end

  def invalid_entry_error
    puts "Invalid entry, please try again:"
  end
end
