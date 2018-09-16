require 'twilio-ruby'
require './lib/restaurant'

class SMSReceiver
  def initialize(restaurant: Restaurant.new, time_client: Time)
    @restaurant = restaurant
    @time_client = time_client
  end

  def parse_order(text)
    order_bits = text.split("\n")
    convert_bits_to_hash(order_bits)
  end

  def respond(order)
    return @restaurant.menu.display_menu.join("\n") if menu_query?(order)
    return help + "\nText 'menu' to see the menu." if instructions_query?(order)
    error_message = "You have selected a dish which is not on the menu.\n" +
                     help
    return error_message unless all_on_menu?(order)
    return ["Thank you for your order.",
            "Your total bill is #{num_to_currency(total_bill(order))}.",
            "Your food will arrive by #{delivery_time}"].join("\n")
  end

  def help
    "Texts should be sent in the format [dish name]:"\
    "[quantity] followed by a new line."
  end

  private

  def all_on_menu?(order)
    order.reduce(true) do |bool, order_item|
      bool && @restaurant.on_the_menu?(order_item[:dish])
    end
  end

  def menu_query?(order)
    order == parse_order("menu")
  end

  def instructions_query?(order)
    order == parse_order("instructions")
  end

  def convert_bits_to_hash(order_bits)
    order = []
    order_bits.each do |item|
      dish, quantity = item.split(":")[0], item.split(":")[1]
      order << { dish: dish, quantity: quantity.to_i }
    end
    return order
  end

  def delivery_time
    (@time_client.now + 3600).strftime("%H:%M")
  end

  def total_bill(order)
    order.reduce(0) do |sum, (order_item)|
      sum + (@restaurant.menu.search_menu(order_item[:dish])[:price] *
        order_item[:quantity])
    end
  end

  def num_to_currency(price)
    sprintf("£%2.2f", price)
  end
end
