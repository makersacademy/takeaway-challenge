require_relative "send_sms"
require 'dotenv/load'

class Order
  def initialize(dish, quantity = 1)
    @selected_dishes = []
    quantity.times { @selected_dishes.push(dish) }
    @confirmed = false
    view_total
  end

  def update(dish, quantity = 1)
    quantity.times { @selected_dishes.push(dish) }
    view_total
  end

  def view_selected
    @selected_dishes
  end

  def view_total
    total = 0
    @selected_dishes.each do |dish|
      total += dish.price
    end
    @total = total
  end

  def confirm_order(
    _to = ENV['TWILIO_TO_NUMBER'],
    message_class = Sms,
    time = calculate_time
  )
    sms = message_class.new
    @confirmed = true
    message = "Thank you! "\
    "Your order was placed and will be delivered before #{time}"
    sms.send(message)
  end

  def calculate_time
    time = Time.now
    "#{time.hour + 1}:#{time.min}"
  end

  def confirmed?
    @confirmed
  end
end
