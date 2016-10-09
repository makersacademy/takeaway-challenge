require 'twilio-ruby'
require_relative 'order'
require 'dotenv'
Dotenv.load

class Restaurant

  attr_reader :total, :order
  attr_accessor :menu, :customer_order_sum

  def initialize
    @menu = []
    @order = Order.new
  end

  def create_menu
    pizza = {food_name: 'Pizza', price: 12}
    pasta = {food_name: 'Pasta', price: 8}
    burger = {food_name: 'Burger', price: 5}
    @menu = [pizza, pasta, burger]
  end

  def show_menu
    @menu
  end

  def take_orders(order, quantity)
    clear_previous_order
    @order.place_order(order, quantity)
  end

  def verify_order(customer_order_sum)
    order.verify_order(customer_order_sum)
    confirm_order
  end

  def confirm_order
    error_message = 'Verification failed, sums not matching'
    raise error_message if order_verified? == false
    close_order
  end

  def close_order
    sms_confirmation
  end

  def clear_previous_order
    @order = Order.new
  end

  private

  def order_verified?
    order.order_verified?
  end

  def sms_confirmation
  account_sid = ENV['ACCOUNT_SID']
  auth_token = ENV['AUTH_TOKEN']

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create({
    :from => ENV['TWILIO_NUMBER'],
    :to => ENV['CUSTOMER_NUMBER'],
    :body => "Thank you! Your order was placed and will be delivered before #{order.delivery_time}"
  })
  end


end
