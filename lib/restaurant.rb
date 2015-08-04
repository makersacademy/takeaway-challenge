require_relative 'customer'
require 'twilio-ruby'

class Restaurant
  include Twilio

  attr_reader :menu
  attr_accessor :customers

  def initialize menuClass=Menu
    @customers = []
    @menu = menuClass.new
  end

  def create_customer customer
    customers << customer
  end

  def send_text customer
    num_string = customer.phone_number
    delivery_time = (Time.new + (25*60)).strftime "%H:%M"
    message = "Thank you for placing your order! It should be with at approx #{delivery_time}"
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]
    @client.account.messages.create({
      :from => ENV["TWILIO_NUMBER"],
      :to => num_string,
      :body => message
    })
  end

  def display_menu
    menu.display_menu
  end

  def check_inclusion? food_item
    menu.check_inclusion? food_item
  end

  def get_price food_item
    menu.price food_item
  end

end
