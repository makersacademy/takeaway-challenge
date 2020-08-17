require_relative 'sms'

class Order

  def initialize
    @order = []
    @text = Sms.new
    @time = Time.now
  end

  attr_reader :order, :text

  def view
    @order.each do |hash|
      puts "#{hash[:quantity]}x #{hash[:item]}....£#{hash[:price]} each"
    end
  end

  def add(item, quantity, price)
    @order << { :item => item, :quantity => 0, :price => price } unless already_in_order(item)
    update_quantity(item, quantity)
  end

  def total
    total = 0
    @order.each do |hash|
      total += (hash[:price] * hash[:quantity])
    end
    return total.round(2)
  end

  def confirmed
    message = "Your order is confirmed and is expected to arrive at #{@time.hour + 1}:#{@time.min}"
    @text.send_message(message)
  end

  private
  def already_in_order(item)
    @order.each do |hash|
      return true if hash.value?(item)
    end
    false
  end

  def update_quantity(item, quantity)
    @order.each do |hash|
      hash[:quantity] += quantity if hash.value?(item)
    end
  end
end
