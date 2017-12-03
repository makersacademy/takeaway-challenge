require 'twilio-ruby'
require 'dotenv/load'

class Takeaway
  attr_reader :menu, :bill

  def initialize
    @menu = Menu.new
    @bill = bill
    @total_order = {}
  end

  def menu
    @menu.print_menu
  end

  def place_order(order)
    @total_order = order.basket
  end

  def calculate_total
    @bill = calculate(@total_order)
  end

  def verify_order(order)
    @bill == order.current_value
  end

  def send_confirmation
    account_sid = ENV["ACCOUNT_STD"] # Your Account SID from www.twilio.com/console
    auth_token = ENV["AUTH_TOKEN"]   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    orders = @total_order.keys.join(",")
    from = "+441622321965" # Replace with your Twilio number
    customer = {
      "+447500835489" => "Tom"
    }
    customer.each do |key, value|
      @client.messages.create({
        from: from,
        to: key,
        body: "Hello, your order of #{orders} was placed and will delivered within one hour."
      })
      puts "Send message to #{value}"
    end
  end

private

  def calculate(_total_order)
    @total_order.values.map { |each_order| each_order.inject(:*) }.map.inject(:+)
  end

end
