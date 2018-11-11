require_relative 'menu'
require_relative 'numbers'
require 'twilio-ruby'

class TakeAway

  attr_reader :basket
  attr_reader :cost
  attr_reader :menu

  def initialize
    @menu = Menu.new
    @cost = 0
    @basket = []
  end

  def add_to_order(menu_num, quantity = 1)
    index = menu_num.to_i - 1
    quantity.times do
      @cost += @menu.items[index][:cost]
      @basket << "#{@menu.items[index][:name]} £#{@menu.items[index][:cost]}"
    end
    added_to_basket(index, quantity)
  end

  def empty_basket
    @basket = []
    @cost = 0
    "Basket emptied"
  end

  def check_basket
    puts "Basket:"
    @basket.each do |item|
      puts item
    end
    "Total cost of items in basket: £#{@cost}"
  end

  def submit_order
    m = MyNums.new
    t = Time.now + 45 * 60
    @client = Twilio::REST::Client.new m.account_sid, m.auth_token
    message = @client.messages.create(
        body: "Your order will be delivered by #{t.strftime "%H:%M"}",
        to: m.my_num,
        from: m.twilio_num)

    message.sid
  end

  private

  def added_to_basket(index, quantity)
    quantity == 1 ? s = "" : s = "s"
    "#{quantity}x #{@menu.items[index][:name]}#{s} added to basket"
  end

end
