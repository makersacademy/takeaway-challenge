require 'dotenv'
require 'twilio-ruby'

class OrderList
  def initialize(restaurant, input = Kernel, order_class = Order, sms_class = Twilio::REST::Client)
    @menu = restaurant.menu
    @order_class = order_class
    @input = input
    @sms_class = sms_class
    @confirmed_orders = []
  end

  def new_order
    pending_order = @order_class.new
    
    loop do
      show_choices
      response = @input.gets.chomp
      case response
      when "1"
        show_menu
      when "2"
        add_to_order(pending_order)
      when "quit"
        break
      when "confirm"
        finalise_order(pending_order)
        break
      end
      display_order(pending_order)
    end
  end

  private

  def show_menu
    puts "\nMenu\n-----------------------"
    @menu.display_all
  end

  def show_choices
    puts "Enter:"
    puts "1 to see the menu"
    puts "2 to add to your order"
    puts "'confirm' to place your order"
    puts "'quit' to cancel"
  end

  def add_to_order(order)
    puts "Input the Item Number:"
    id = @input.gets.chomp.to_i
    selection = @menu.select(id)
    puts "Enter the quantity you'd like:"
    quantity = @input.gets.chomp.to_i
    order.add_item(selection, quantity)
  end

  def finalise_order(order)
    raise "Your order is empty!" if order.empty?

    @confirmed_orders.push(order)
    puts "Order received! You'll get a text shortly confirming your delivery time."
    send_sms_confirmation
  end

  def display_order(order)
    puts
    puts "Current order:"
    order.to_s
    puts
  end

  def send_sms_confirmation
    Dotenv.load
    estimated_delivery = Time.now + 3600
    formatted = "#{estimated_delivery.hour}:#{estimated_delivery.min}"
    message = "Your order has been accepted! It will be with you before #{formatted}."
    client = @sms_class.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

    client.messages.create(
      from: ENV['TWILIO_FROM'],
      to: ENV['TWILIO_TO'],
      body: message
    )
  end
end
