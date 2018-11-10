require_relative 'menu'
require 'twilio-ruby'
require_relative 'numbers'

class Order

  attr_reader :basket
  attr_reader :cost

  def initialize
    @cost = 0
    @menu = Menu.new
    @basket = []
  end

  def add(num)
    index = num.to_i - 1
    @cost += @menu.items[index][:cost]
    @basket << "#{@menu.items[index][:name]} £#{@menu.items[index][:cost]}"
    added_to_basket(index)
  end

  def view_basket
    puts "Basket:"
    @basket.each do |item|
      puts item
    end
    puts "Total cost of items in basket:\n£#{@cost}"
  end

  def submit
    t = Time.now + 45*60
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Your order will be delivered by #{t.strftime "%H:%M"}",
        to: my_num,
        from: twilio_num)

    puts message.sid
  end

  private

  def added_to_basket(num)
    puts "#{@menu.items[num][:name]} added to basket"
  end
end
