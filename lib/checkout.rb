require_relative 'text_alert'

class Checkout

  attr_reader :text_alert

  def initialize(text_alert = TextAlert.new)
    @text_alert = text_alert
  end

  def sum_each(order, prices)
    summary_string = ""
    order.each do |key, value|
      cost = prices[key] * value
      summary_string << "#{value}x #{key} = £#{cost}, "
    end
    summary_string.chomp(", ")
  end

  def sum_total(order, prices)
    total = 0
    order.each { |key, value| total += prices[key] * value }
    total.round(2)
  end

  def finalise_payment(payment, order, prices)
    expected_payment = sum_total(order, prices)
    bad_payment = "Cannot be accepted, you need to pay £#{expected_payment}"
    fail bad_payment if payment != expected_payment
    text_alert.send_confirmation
  end

end
