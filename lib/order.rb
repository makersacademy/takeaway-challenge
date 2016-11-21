
require_relative 'send_sms'

class Order

  attr_reader :basket, :menu

  def initialize (menu_klass, sms_klass = SendSMS)
    @menu = menu_klass.list
    @sms = sms_klass
    @basket = Hash.new(0)
  end

  def add_to_basket(input)
    basket[input.to_sym] += 1
  end

  def calculate_total
    basket.map do |pizza, quantity|
      menu[pizza] * quantity
    end.inject(:+)
  end

  def check_payment(payment)
    fail "Incorrect payment amount" unless payment_correct?(payment)
    send_message
  end

  def payment_correct?(payment)
    payment == calculate_total
  end

  def delivery_time
    (Time.new + 3600).strftime("%H:%M")
  end

  def send_message
    message = "Thank you! Your order will be delivered before #{delivery_time}"
    sms.new(message)
    message
  end

  private
  attr_reader :sms


end
