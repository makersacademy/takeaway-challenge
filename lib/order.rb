require './lib/dish.rb'
require './lib/menu.rb'

require 'twilio-ruby'
require 'time'

class Order

  attr_reader :items

  def initialize
    @items = []
    @client = Twilio::REST::Client.new 'ACe711baf45d2e9fe21e2d2ad8d8858108', 'e1d08802b3957ec5da9f470f19e61f11'
  end

  def add(dish)
    @items << dish
  end

  def check
    items.length
  end

  def place_order
    @client.messages.create(
      from: '+441133205194',
      to: '+447719198784',
      body: confirmation_message
    )
  end

  private

  def confirmation_message
    current_time = Time.new
    message = "Thank you! Your order was placed at #{current_time.hour}:#{current_time.min} and will be delivered in half an hour."
  end

end
