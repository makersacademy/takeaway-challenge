require "./lib/order.rb"
require "./lib/menu.rb"
require "Dotenv"
require "twilio-ruby"


class Host

  attr_reader :current_menu, :new_order

  def initialize(current_menu = Menu.new, order_klass = Order)
    @credentials = Dotenv.load
    @current_menu = current_menu
    @order_klass = order_klass
    @new_order = @order_klass.new
    @client = Twilio::REST::Client.new @credentials["ACCOUNT_SID"], @credentials["AUTH_TOKEN"]
  end

  def show_menu
    puts "\nWelcome to Yummy Sushi, today's menu is:"
    @current_menu.show_items
  end

  def add_to_menu(item)
    @current_menu.add_item(item)
  end

  def add_to_order(item)
    @new_order.add_item(item)
  end

  #TODO - add remove from order method.

  def show_order
    @new_order.check_order
  end

  def place_order
    print_recipt
    send_message
    @new_order = @order_klass.new
  end

  def print_recipt
    @new_order.print_final_order
  end

  def send_message
    @client.messages.create(
      from: @credentials["MOBILE_FROM"],
      to: @credentials["MOBILE_TO"],
      body: "Thank you! Your order has been placed and will be delivered in about an hour"
    )
  end

end
