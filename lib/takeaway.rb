require_relative 'send_sms'

class TakeAway

  def initialize
    @menu = { "chips" => 2.5, "kebab" => 5.5, "burger" => 4.75 }
    @basket = {}
  end

  def display_menu
    @menu
  end

  def select(food_item, qty = 1)
    @basket[food_item] = qty
    "You have added #{food_item} x#{qty} portions"
  end

  def summary
    total = 0
    @basket.map { |k, v| total += @menu[k] * v }
    "You summary total amount so far is £#{total}"
  end

  def complete_order
    "Thankyou for your order"
  end

  def text
    send = SendSMS.new
    send.sms
  end

end
