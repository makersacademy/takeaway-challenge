require_relative 'menu'
require 'twilio-ruby'

class Order
  attr_reader :menu, :basket, :total, :text_message

  def initialize
    @basket = []
    @total = 0
  end

  def add_item(item, amount = 1)
    @basket << [item, amount]
    if item == 'sushi'
      @total += (amount * 5)
    end
    if item == 'noodles'
      @total += (amount * 7)
    end
    if item == 'edamame'
      @total += (amount * 3)
    end
  end

  def order_confirmation
    puts 'Please confirm your order:'
    puts 'Your order:' + @basket.to_s
    puts 'Total bill: £' + @total.to_s
    puts "Is this correct? (Y/N)"
    user_input = gets.chomp
    if user_input == "Y"
      send_text
    else
      puts "Please return to the menu and amend your order."
    end
  end

  private

  def send_text
    auth = CSV.read('./lib/data.csv')
    account_sid = auth[0][1]
    auth_token = auth[1][1]
    time = Time.now
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
        body:
        "Thank you for your order. Your food will be delivered by #{time}",
        to: auth[2][1],
        from: auth[3][1])
  end
end
