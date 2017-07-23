require 'dotenv/load'
require 'twilio-ruby'

class Takeaway
  attr_reader :menu, :total_order, :charge

  def initialize
    @menu = menu
    @charge = charge
    @total_order = {}
  end

  def menu
    @menu = { pizza: 8, rice: 7, chicken: 6 }
  end

  def menu?
    @menu.size >= 1
  end

  def print_menu
    @menu.map { |item, value| "#{item} is #{value.to_f}" }.join(", ")
  end

  def place_order(order)
    @total_order = order.current_orders
  end

  def calculate_total
    @charge = calculate(@total_order)
  end

  def verify_order(order)
    @charge == order.current_value
  end

  def send_confirmation
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    from = "+441618509241" # twilio number
    customer = {
      "07958301106" => "Thor"
    }
    orders = @total_order.keys.join(",")

    customer.each do |key, value|
      @client.messages.create({
      from: from,
      to: key,
      body: "Thank you! Your order of #{orders} was placed and will be delivered in 1 hour"
      })
      puts "Sent message to #{value}"
    end
  end

  def calculate(item)
    item.values.map { |each_order| each_order.inject(:*) }.map.inject(:+)
  end

end
