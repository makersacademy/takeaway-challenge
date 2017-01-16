require 'twilio-ruby'
require './lib/sms'

class Order
  attr_reader :current_order, :sms, :total

  def initialize
    @current_order = []
    @sms = SMS.new
    @total = 0
  end

  def add(list, dish, quantity)
    @current_order << {dish: list.get(dish), quantity: quantity}
    @total += list.get(dish).price*quantity
  end

  def read
    current_order.each.map do |hash|
      {description: hash[:dish].description, quantity: hash[:quantity]}
    end
  end

  def place(given_total)
    error_message = "Order total incorrect. Current total is #{self.total}"
    raise error_message if !total_correct(given_total)
    sms.send_message
  end

  def total_correct(given_total)
    given_total == self.total
  end

end
