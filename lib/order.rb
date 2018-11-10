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

  def add(menu_num, quantity)
    index = menu_num.to_i - 1
    quantity.times do
      @cost += @menu.items[index][:cost]
      @basket << "#{@menu.items[index][:name]} £#{@menu.items[index][:cost]}"
      added_to_basket(index, quantity)
    end
  end

  def view_basket
    puts "Basket:"
    @basket.each do |item|
      puts item
    end
    puts "Total cost of items in basket:\n£#{@cost}"
  end

  def submit
    m = MyNums.new
    t = Time.now + 45*60
    @client = Twilio::REST::Client.new m.account_sid, m.auth_token
    message = @client.messages.create(
        body: "Your order will be delivered by #{t.strftime "%H:%M"}",
        to: m.my_num,
        from: m.twilio_num)

    puts message.sid
  end

  private

  def added_to_basket(index)
    puts "#{quantity}x #{@menu.items[index][:name]} added to basket"
  end
end
