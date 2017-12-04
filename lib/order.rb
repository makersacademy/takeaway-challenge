require_relative "./message.rb"
require_relative "./menu.rb"

class Order
  attr_reader :current_order

  def initialize(dish, price, time)
    @current_order = [{ dish => price }]
    @order_total = 0
    @order_time = time
    @message = Message.new(@order_time)
  end

  def add_to_order(dish, price)
    @current_order << { dish => price }
  end

  def order_total
    @current_order.each do |item|
      item.each {|dish_name, dish_price| @order_total += dish_price}
    end
    @order_total
  end

  def print_current_order
      @current_order.each do |item|
        item.each do |dish, price|
          p "#{dish} - #{price}"
        end
      end
    end
end
