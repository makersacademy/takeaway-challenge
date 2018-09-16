require 'twilio-ruby'

class Takeaway

  attr_reader :basket, :menu

  def initialize
    @menu = {
      :Margherita => 4.99,
      :Pepperoni => 6.99,
      :"Four Cheese" => 5.99,
      :Sausage => 6.99,
    }
    @basket = {} # item name and quantity
    @sum_total = 0
    @time = (Time.now + 3600).strftime "%H:%M"
  end

  def order(food, amount = 1)
    raise "We do not sell that item" unless @menu.has_key?(food.to_sym)
    @basket[food.to_sym] = amount
  end

  def total
    @basket.map { |k, v| @sum_total += @menu[k] * v }
    "£#{@sum_total}"
  end

  def pricecheck
    @basket.map { |k, v|
      "#{v}x #{k}: £#{@menu[k] * v}"
    }.join(", ")
  end

  def submit_order
    send_message("Your order total is #{total}, it will arrive by #{@time}")
  end

  def send_message(message)
    account_sid = 'AC74ebcb8dac1bfec69256eab154777079'
    auth_token = '4b2f2d121b23694c045cab2c88ff06f8'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+447492884657'
    to = '+447590478987' # numbers fixed for purposes of this exercise

    client.messages.create(
      from: from, to: to, body: message)
  end

end
