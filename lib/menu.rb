require 'csv'
require 'twilio-ruby'
require_relative 'order'
require_relative 'load_menu_module'

class Menu
  include LoadMenu
  def initialize(restaurant: "fishnchips.csv", order: Order.new(restaurant: restaurant))
    @order = order
    load_menu(restaurant)
    account_sid = ENV['TWILIOSID']
    auth_token = ENV['TWILIOAUTH']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = ENV['TWILIONUMBER'] # Your Twilio number
    @to = ENV['PHONENUMBER'] # Your mobile phone number
  end

  def display_menu
    menu_array = []
    @menu_hash.each do |key, value| 
      menu_array << "#{key}: £#{value}"
    end
    menu_array.join("\n")
  end

  def order(dish, quantity, order: @order)
    order.add(dish, quantity)
  end

  def check_order(order: @order)
    order.receipt
  end

  def confirm_order(order: @order)
    puts order.receipt
    puts 'Would you like to confirm your order? (y/n)'
    user_input = gets.chomp
    if user_input == 'y'
      now = Time.new
      delivery_time = now + (60 * 60)
      @client.messages.create(
        from: @from,
        to: @to,
        body: "Hey friend! Your food is on it's way! It should arrive by #{delivery_time.strftime("%I:%M %p")}!"
        )
    else
      puts 'Order not sent'
    end
  end
end
