require "./lib/order.rb"
require "./lib/menu.rb"
require "Dotenv"
require "twilio-ruby"


class Host

  attr_reader :current_menu, :new_order

  def initialize(current_menu = Menu.new, new_order = Order.new)
    @credentials = Dotenv.load
    @current_menu = current_menu
    @new_order = new_order
    @client = Twilio::REST::Client.new @credentials["ACCOUNT_SID"], @credentials["AUTH_TOKEN"]

  end

  def show_menu
    puts "Welcome to Yummy Sushi, today's menu is:"
    @current_menu.show_items.clone
  end

  def add_to_order(item)
    @new_order.add_item(item)
  end

  def show_order
    @new_order.check_order
  end

  def place_order
    print_recipt
    send_message
    @new_order = new_order.new
  end

  def print_recipt
    @new_order.print_final_order
  end

  def send_message
    @client.messages.create(
      from: @credentials["MOBILE_FROM"],#'+441372700118',
      to: @credentials["MOBILE_TO"], #+447508980065',
      body: "Thank you! Your order was placed and will be delivered in about an hour"
    )
  end

end
