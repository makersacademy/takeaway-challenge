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
      price = item[:dish].price
      quantity = item[:quantity]
      total += price * quantity
    end
    total
  end

  def receipt
    receipt = "Your order has been placed and will be delivered at #{time}: "
    receipt << receipt_items
    receipt << ". Total: #{pound_str(total)}"
    receipt
  end

  private

  def receipt_items
    items = ''
    @list.each_with_index do |item, index|
      items << receipt_item_str(item)
      items << ", " if index < (@list.length - 1)
    end
    items
  end

  def receipt_item_str(item)
    na = item[:dish].name
    qu = item[:quantity]
    pr = item[:dish].price * qu
    "#{na} x#{qu} = #{pound_str(pr)}"
  end

  def time
    (@time_klass.new + 3600)
  end


end
