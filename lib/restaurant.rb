require_relative "./customer.rb"
require "twilio-ruby"

class Restaurant
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

  def initialize
  end

  def ask_order(customer, twilio_class = Twilio::REST::Client)
    client = twilio_class.new(TWILIO_SID, TWILIO_TOKEN)
    client.messages.create(
      from: TWILIO_NUMBER,
      to: customer.phone_number(),
      body: message_body
    )
  end
  private

  def message_body
    "Please submit your order from the menu below.#{DISHES}
    Please write your order in the following format:
    Quanitity of the dish, name of the dish, sum of dishes.
    e.g. 1, meat dish, 2, pesceterian dish, 3 "
  end
end
