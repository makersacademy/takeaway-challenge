require_relative 'send_sms'

class Order

  attr_reader :meal, :payment, :menu

  def initialize(menu, meal)
    @menu = menu
    @meal = meal[0]
    @payment = meal[1]
  end

  def calculate_total
    total = 0
    meal.each{|pizza, quantity| total += menu[pizza] * quantity}
    total
  end

  def check_payment
    fail "Incorrect payment amount" unless payment_correct?
  end

  def payment_correct?
    payment == calculate_total
  end

  def delivery_time
    (Time.new + 360).strftime("%H:%M")
  end

  def send_message
    message = "Thank you! Your order will be delivered before #{delivery_time}"
    SendSMS.new(message)
    message
  end


end
