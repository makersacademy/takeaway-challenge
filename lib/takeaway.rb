require 'twilio-ruby'
require './menu.rb'

class TakeAway

  attr_reader :dishes
  attr_reader :basket
  attr_reader :running_total

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @running_total = []
  end

  def print_dishes
    @menu.dishes.each { |key, value| puts "#{key} - £#{value}" }
  end

  def order(dish, quantity = 1)
    raise "dish not available on menu" unless @menu.dishes.include? dish
    quantity.times do @basket << { dish => @menu.dishes[dish] } end
    quantity.times do @running_total << @menu.dishes[dish] end
  end

  def basket_total
    @running_total.sum
  end

  def place_order(expected_total)
    raise "order sum does not match expected total" unless expected_total == basket_total
    twilio
  end

  def twilio
    account_sid = "ACa2363a455888d25a3a3b9261f091ad92"
    auth_token = "497588b24c946085cd64f0e6e65670fe"
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
    body: "Thank you! Your order was placed and will be delivered before
    #{(Time.now + 1 * 60 * 60).strftime("%H:%M")}",
    to: "+447716626862",
    from: "+441302590314")
    puts message.sid
  end
end
