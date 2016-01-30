require 'twilio-ruby'

class Takeaway
  def initialize(menu)
    @menu = menu
    @basket = {}
    @cost = OrderCost.new
  end

  attr_reader :basket

  def total
    "Total: £#{cost.total.to_f}0"
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
    sum = 0
    @basket.each do |key, value|
      sum += value
    end
    sum
  end

  def send_text(message)
    account_sid = 'AC5e5b5a04f84d6960beb1ea1bf718a737'
    auth_token = 'c104097a2e1b217674117dc8e86e6212'
    @client = Twilio::REST::Client.new account_sid, auth_token
    text = @client.account.messages.create(:body => message,
      :to => "+447411127625", :from => "+441458570040")
  end

  def ordered(dish, number)
    "#{dish} x#{number}"
  end

  def price(dish, number)
    @menu.price(dish) * number
  end

end