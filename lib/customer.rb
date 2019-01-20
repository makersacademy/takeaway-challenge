require_relative 'menu'
require_relative 'cart'
require 'twilio-ruby'

class Customer

  attr_reader :menu, :cart

  def initialize(menu = Menu.new, cart = Cart.new)
    @menu = menu
    @cart = cart
  end

  def start
    loop do
      print_menu
      process(STDIN.gets.chomp)
    end
  end

  def view_menu
    menu.print
  end

  def select_dishes
    puts "Type each dish number that you wish to add to your cart, pressing enter after each."
    puts "To finish, just hit enter again."
    get_input
  end

  def view_total
    puts "Your total: £#{cart.total}"
  end

  def review_cart_contents
    cart.format_contents
  end

  def place_order
    puts "Please enter your phone number, beginning it with '+44':"
    @customer_number = gets.chomp
    send_confirmation_text
  end

  private

  def print_menu
    puts "Please select an option by typing a number, and then press enter."
    puts "1. View our menu"
    puts "2. Add your selections to the cart"
    puts "3. View your total"
    puts "4. Review the cart"
    puts "5. Place order"
    puts "6. Close App"
  end

  def process(selection)
    case selection
      when "1"
        view_menu
      when "2"
        select_dishes
      when "3"
        view_total
      when "4"
        review_cart_contents
      when "5"
        place_order
      when "6"
        exit #terminate program
      else
        puts "Not recognised. Try again."
    end
  end

  def send_confirmation_text
    account_sid = 'AC9e735de55fbe2f8cc2cddb2674bd502e'
    auth_token = '576e551d6cf03cf76aec415121e50913'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441599312013' # Your Twilio number
    to = @customer_number # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{an_hour_from_now}"
    )
  end

  def an_hour_from_now
    time = Time.new
    "#{((time.hour) + 1).to_s}:#{time.min.to_s}"
  end

  def get_input
    args = []
    dish = STDIN.gets.chomp
    until dish.empty? do
      args << dish.to_i
      dish = STDIN.gets.chomp
    end
    args.each do |arg|
      cart.contents << menu.items[ arg - 1 ]
    end
  end

end
