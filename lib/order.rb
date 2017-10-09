require_relative 'menu'
require 'twilio-ruby'

class Order

  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def add(item, amount = 1)
    raise 'This is not on the menu!' unless @menu.dishes.include?(item)
    amount.times { @basket << item }
  end

  def calculate_total
    price = 0
    @basket.each { |item| price += @menu.dishes[item] }
    price
  end

  def place_order
    order_summary
  end

  def order_summary
    "Thank you! Your order totalling £#{calculate_total} will arrive at #{delivery_time}"
  end

  def delivery_time
    t = (Time.now + 1 * 60 * 60)
    t.strftime("%H:%M")
  end

  def text_message
    account_sid = "ACdb9eb98941aaa35cc21e47ab42ae2945"
    auth_token = "885b34502ef1fd7c59fc9c706800ebc6"

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: order_summary,
        to: "+447496950977",
        from: "+441484906185")

    puts message.sid
  end


end
