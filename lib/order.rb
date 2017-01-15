require 'twilio-ruby'

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
  send_message
end

def send_message
  if Time.now.hour!=24
    time = "#{Time.now.hour+1}:#{Time.now.min}"
  else
    time = "00:#{Time.now.min}"
  end

  client = Twilio::REST::Client.new(
    "AC3dc8f9d2b8b60c1e6cc4ccbb9ebc83f7",
    "d450981a93efaa355c231db9bcf35c0e"
  )

  client.messages.create(

    to: "+353 86 350 9027",
    from: "+353 86 180 2719",
    body: "Your order has been placed and will arrive at approx. #{time}"
  )

end

end
