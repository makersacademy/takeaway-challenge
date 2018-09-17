require_relative 'order'
require_relative 'menu'

class Text

  attr_reader :message

  def initialize(order)
    @order = order
  end

  def format_time(time)
    delivery_hour = time.hour + 1
    delivery_minutes = time.min
    return "#{delivery_hour}:#{delivery_minutes}"
  end

  def message(time = Time.new)
    if true#@order.add_total
      "Thank you! Your order was placed and will be delivered before " + format_time(time) + "."
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
