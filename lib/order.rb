require_relative 'formatter'

class Order
  include Formatter

  attr_reader :list

  def initialize(time_klass = Time)
    @time_klass = time_klass
    @list = Array.new
  end

  def add(dish, quantity)
    @list << {dish: dish, quantity: quantity}
  end

  def total
    total = 0
    @list.each do |item|
      price, quantity = item[:dish].price, item[:quantity]
      total += price * quantity
    end
    return total
  end

  def receipt
    receipt = "Your order has been placed and will be delivered at #{time}: "
    @list.each_with_index do |item, index|
      na, qu, = item[:dish].name, item[:quantity]
      pr = item[:dish].price * qu
      receipt << "#{na} x#{qu} = #{pound_str(pr)}"
      receipt << ", " if index < (@list.length - 1)
    end
    receipt << ". Total: #{pound_str(total)}"
    return receipt
  end

  def time
    (@time_klass.new + 3600)
  end


end
