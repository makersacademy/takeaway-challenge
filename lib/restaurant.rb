Dir["./lib/*.rb"].each {|file| require file }
class Restaurant

  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def add_to_order(dish_name, qty)
    if @current_order.include?(dish_name)
      dish_name.update_qty(qty)
    else
      @current_order << dish_name
      dish_name.update_qty(qty)
    end
  end
  
  def review_order
    @current_order.each do |order|
      puts "#{order.name} - #{order.qty} - Price: £#{order.price}"
    end
    puts "total £#{order_total}"
  end
  
  def pay_order(amount)
    raise "Sorry, this is not enough to cover the cost of the meal!" if amount != order_total

    "Your order has been confirmed! A text message will be sent shortly."
  end

  private
  def order_total
    total = 0
    @current_order.each do |dish|
      total += (dish.price * dish.qty)
    end
    return total
  end
end
