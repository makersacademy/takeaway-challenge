require "twilio-ruby"

class Restaurant

  attr_reader :menu, :orders

  def initialize
    @menu = { "starter"=>3, "main"=>6, "drinks"=>2 }
    @orders = {}
  end

  def take_order dish, amount
    @orders[dish] = amount
  end

  def confirm_order total
    fail "Total does not match sum of dish prices" unless total_correct? total
    send_order_confirmation
  end

  def total_correct? total
    total == self.total_calc ? true : false
  end

  def total_calc
    @orders.inject(0) { |total, (dish, amount)| total + (@menu[dish] * amount) }
  end

  def send_order_confirmation twilio_ruby
    twilio_ruby.send_sms_request
  end

end
