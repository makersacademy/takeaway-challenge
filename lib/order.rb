require_relative 'menu'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load('required.env')

class Order
  attr_reader :summary

  def initialize(restaurant)
    @summary = {}
    @menu = Menu.new(restaurant)
  end

  def print_menu
    puts @menu.list
  end

  def add(dish, quantity)
    error_check_add_arguments(dish, quantity)
    price = @menu.dishes[dish].to_f * quantity
    add_to_summary(dish, quantity, price)
    @summary
  end

  def print_summary
    @summary.each { |dish, hash| puts "#{hash[:quantity]} - #{dish} - £#{"%.2f" % hash[:price]}" }
  end

  def checkout(name, number, address)
    total = calculate_total
    puts "#{name}, #{address}, #{number}\n#{@menu.restaurant}\n**************"
    print_summary
    puts "**************\nTOTAL: £#{"%.2f" % total}\n**************"
    send_text(number)
  end

  private

  def error_check_add_arguments(dish, quantity)
    raise "#{dish} not on #{@menu.restaurant} menu" unless @menu.dishes.has_key?(dish)
    raise "please input a quantity as an integer" unless quantity.is_a? Integer
  end

  def add_to_summary(dish, quantity, price)
    if @summary.has_key?(dish)
      @summary[dish][:quantity] += quantity
      @summary[dish][:price] += price
    else
      @summary[dish] = { quantity: quantity, price: price }
    end
  end

  def calculate_total
    @summary.map { |_, hash| hash[:price] }.sum
  end

  def send_text(number)
    arrival_time = (Time.now + 3600).strftime("%k:%M")

    client.messages.create(
    from: '+19166337879',
    to: number,
    body: "Thank you! Your order was placed and will be delivered before #{arrival_time}"
    )
  end

  def client
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)
  end
end
