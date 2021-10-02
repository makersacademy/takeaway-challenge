require_relative 'order'
require_relative '../sms'

class Takeaway
  attr_reader :basket
  def initialize(dishes = [], order_class: Order)
    @dishes = dishes
    @order_class = Order
  end

  def dishes
    @dishes.dup
  end
  
  def menu
    puts dishes.map{ |dish| format(dish) }.join("\n\n")
  end

  def format(dish)
    "Dish: #{dish.name}\nPrice: £#{dish.price}"
  end

  def order(item)
    @basket ? @basket.items << item : @basket = @order_class.new([item])
  end
  
  def order_time
    time = Time.now + 3600
    time.strftime("%H:%M")
  end

  def confirm
    text("Thank you! Your order has been placed and will be delivered by #{order_time}.")
  end
end