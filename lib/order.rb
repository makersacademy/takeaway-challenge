# Order class definition
# this class is responsible for collecting and processing orders
# and requesting text confirmation from SendSMS class
# require_relative 'send_sms'
class Order
  attr_reader :basket, :total
  def initialize(send_sms_class = SendSMS)
    @send_sms_class = send_sms_class
    @basket = [] # save a hash like {dish: quantity}
    @total = 0
  end

  def add_to_order(dish, quantity)
    @basket << [dish, quantity]
  end

  def checkout(phone_number)
    raise 'Basket is empty' if @basket.empty?
    request_confirmation(phone_number)
  end

  def calculate_total
    raise 'Basket is empty' if @basket.empty?
    @basket.each { |dish| @total += dish.first.price * dish.last }
    @total
  end

  # private
  def request_confirmation(phone_number)
    new_sms = @send_sms_class.new()
    new_sms.send(phone_number)
  end

end
