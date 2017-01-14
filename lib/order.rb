require './lib/dish.rb'
require './lib/menu.rb'
require 'twilio-ruby'

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
      body: 'Thank you! Your order was placed and will be delivered before 18:52'
    )
  end

end
