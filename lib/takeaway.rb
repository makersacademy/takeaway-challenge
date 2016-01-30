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
    Use Twilio Gem
  end

  def ordered(dish, number)
    "#{dish} x#{number}"
  end

  def price(dish, number)
    @menu.price(dish) * number
  end

end