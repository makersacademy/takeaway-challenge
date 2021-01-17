require_relative 'sms'

class Order

  attr_reader :orders, :order

  def initialize
    @orders = []
    @text = Sms.new
    @time = Time.now
  end
  
  def add(dish, quantity, price)
    @orders << { dish: dish, quantity: quantity, price: price }
  end

  def total
    calculation
  end

  def confirmed
    message = "Your order is confirmed and is expected to arrive at #{@time.hour + 1}:#{@time.min}"
    @text.send_message(message)
  end

  private

  def calculation
    total = 0
    @orders.each do |hash|
      total += (hash[:quantity] * hash[:price])
    end
    total
  end

end
