require_relative 'order'
require_relative 'menu'
require 'twilio-ruby'

class OrderProcess

  def initialize
    @restaurant_name = Menu.new.take_away_name
    @order = Order.new
  end

  def show_menu
    Menu.new.show_list
  end

  def select_items(customer_choice)
    @order.select_items(customer_choice)
  end

  def customer_order_summary
    @order.customer_order_summary
  end

  def subtotal
   @order.subtotal
  end

  def order_process
    puts "Welcome to #{@restaurant_name}"
    show_menu
    order_asker
    select_items(1)
    select_items(1)
    customer_order_summary
  end

  def confirmation_text

    account_sid = 'AC434407bd7130d35abe9799d542f94116'
    auth_token = 'c95e989cf07855de0747bd4a32a117bf'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+12513579138' # Your Twilio number
    to = '+447912212181' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thanks for your order of from Costa Del Oval. It will arrive #{Time.new}!"
    )
  end

  private

  def order_asker
    puts "Enter an item number or checkout to pay"
  end
end