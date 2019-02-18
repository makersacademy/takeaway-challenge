require_relative "./customer.rb"
require_relative "./order.rb"
require "twilio-ruby"
require "time"

class Restaurant
  attr_reader :order_class
  # In order to apply security when using the twilo library for sending
  # messages to customers, we save the NUMBER, SID and TOKEN of Twilio
  # as environment variables.
  TWILIO_NUMBER = ENV['TWILIO_NUMBER']
  TWILIO_TOKEN = ENV['TWILIO_TOKEN']
  TWILIO_SID = ENV['TWILIO_SID']

  DISHES = {
  "meat dish" => "£10",
  "vegeterian dish" => "£15",
  "pesceterian dish" => "£20" }

  def initialize(order_class = Order)
    @order_class = order_class
  end

  def ask_order(customer, twilio_class = Twilio::REST::Client)
    client = twilio_class.new(TWILIO_SID, TWILIO_TOKEN)
    client.messages.create(from: TWILIO_NUMBER,to: customer.phone_number(),body: order_taking_message
    )
  end

  def check_order(order_string)
    order = @order_class.new(order_string)
    order.check_order
  end

  def confirmation_sending(customer, order_string, twilio_class = Twilio::REST::Client)
    check_order(order_string)
    client = twilio_class.new(TWILIO_SID, TWILIO_TOKEN)
    client.messages.create(from: TWILIO_NUMBER,to: customer.phone_number(),body: confirmation_message
    )
  end


  private

  def order_taking_message
    "Please submit your order from the menu below.#{DISHES}
    Please write your order in the following format:
    Quanitity of the dish, name of the dish, sum of dishes.
    e.g. 1, meat dish, 2, pesceterian dish, 3 "
  end

  def confirmation_message(time_class = Time)
    "Thank you! Your order was placed and will be delivered before #{Time.new().hour+1}:#{Time.new().min} "
  end
end
