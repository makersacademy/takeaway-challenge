require_relative 'order'
require 'twilio-ruby'

class Pierogi

  attr_reader :menu
  attr_reader :orders

  def initialize
    @menu = { "small pierogi" => 1, "large pierogi" => 3, "supersize pierogi" => 4,
              "meat pierogi" => 4, "chocolate pierogi" => 2, "honey pierogi" => 2 }
    @orders = []
  end

  def add_to_menu(dish, price)
    raise "Price must be a number" unless price.is_a?(Integer)
    @menu[dish] = price
    nil
  end

  def show_food
    pretty_printed_menu = []
    @menu.each do |key, value| 
      pretty_printed_menu << "#{key} for #{value}"
    end
    pretty_printed_menu.join("\n")
  end

  def accept_order(order = Order.new)
    @orders << order
  end

  def pick(item)
    order_item = []
    order_item << item
    order_item << @menu[item]
  end

  def confirm_order
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441234911631'
    to = ENV['NUMBER']

    client.messages.create(
      from: from,
      to: to,
      body: "Your order is confirmed!\novo"
      )    
  end
end
