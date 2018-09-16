require 'twilio-ruby'
require './lib/restaurant'

class SMSReceiver

  attr_reader :text_api

  def initialize(text_api: Twilio::TwiML::MessagingResponse, restaurant: Restaurant.new)
    @text_api = text_api
    @restaurant = restaurant
  end

  def parse_order(text)
    order_bits = text.split("\n")
    return convert_bits_to_hash(order_bits)
  end

  def order_confirmation(order)
    return "You have selected a dish which is not on the menu.\n" + help unless all_on_menu?(order)
    return "great order"
  end

  def help
    "Texts should be sent in the format [dish name]: [quantity] followed by a new line."
  end

#  private

  def all_on_menu?(order)
    order.reduce(true) do |bool,order|
      bool && @restaurant.on_the_menu?(order[:dish])
    end
  end

  def convert_bits_to_hash(order_bits)
    order = []
    order_bits.each do |item|
      dish, quantity = item.split(":")[0], item.split(":")[1]
      order << { dish: dish, quantity: quantity }
    end
    return order
  end


end
