require_relative 'order'
require_relative 'menu'
require 'date'

class Text

  def initialize(order)
    @order = order
  end

  def time
    current_time = Time.now
    delivery_hour = current_time.hour + 1
    delivery_minutues = current_time.min
    return "#{delivery_hour}:#{delivery_minutues}"
  end

  def message
    if @order.add_total
      puts "Thank you! Your order was placed and will be delivered before " + time + "."
    else
      raise "I'm sorry, there's an error in the total. Please place your order again."
    end
  end

end

# order = Order.new
# order.chosen_dishes("snack seaweed", 2)
# order.chosen_dishes("smoky huitlacoche, chilli sauce, vegan cheese, avocado and quesadillas")
# text = Text.new(order)
# text.time
# text.message
