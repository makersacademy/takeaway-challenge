require 'twilio-ruby'
require './lib/sms'

class Order
  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def add(list, dish, quantity)
    hash = {dish: list.get(dish), quantity: quantity}
    @current_order << hash
  end


  def total
    sum = 0
    current_order.each do |hash|
      sum += hash[:dish].price*hash[:quantity]
    end
    sum
  end

  def read
    current_order.each.map do |hash|
      {description: hash[:dish].description, quantity: hash[:quantity]}
    end
  end

  def place(given_total)
    error_message = "Order total incorrect. Current total is #{self.total}"
    raise error_message if given_total != self.total
    Sms.new.send_message
  end

end
