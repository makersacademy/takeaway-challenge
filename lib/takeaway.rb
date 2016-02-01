require 'twilio-ruby'
require 'dotenv'
Dotenv.load
require_relative 'ordercost.rb'

class Takeaway
  def initialize(menu)
    @menu = menu
    @basket = {}
    @cost = OrderCost.new
  end

  attr_reader :basket

  def total
    "Total: £#{float}0"
  end

  def check_total
    cost.total == basket_sum
  end

  def menu
    @menu.dishes
  end

  def order(dish, number=1)
    @basket[ordered(dish,number)] = price(dish,number)
    cost.add(price(dish,number))
    "You have just ordered #{number}x #{dish}!"
  end

  def complete_order
    fail "This order was not completed" if !check_total
    send_text(message)
    reset
    "Thank you for ordering!"
  end

  private

  attr_reader :cost

  def reset
    @basket = {}
    cost.reset
  end

  def message
    message = "Thank you for your order of £#{cost.total}0."
    message << " Your food will be delivered within an hour."
  end

  def basket_sum
    @basket.inject(0) {|sum, (_key, value)| sum + value }
  end

  def send_text(message)
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    text = @client.account.messages.create(:body => message,
      :to => ENV['MY_NUMBER'], :from => ENV['FROM_NUMBER'])
  end

  def float
    total_cost = cost.total
    total_cost.to_f
  end

  def ordered(dish, number)
    "#{dish} x#{number}"
  end

  def price(dish, number)
    @menu.price(dish) * number
  end

end