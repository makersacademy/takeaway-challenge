require_relative 'menu'
require_relative 'order'
require_relative 'text'

class Takeaway

  attr_reader :menu, :order_klass, :text, :order

  def initialize(order_klass,menu,text=nil)
    @menu = menu
    @order_klass = order_klass
    @text = text
  end

  def new_order
    @order = order_klass.new(dishes)
  end

  def to_s
    menu.show
  end

  def place(specific_order,value)
    msg = "Incorrect value - should be £#{sum(specific_order)}"
    fail msg if value != sum(specific_order)
    confirmation(specific_order)
  end

  private

  attr_reader :dishes

  def dishes
    menu.dishes
  end

  def deliver_time
    (Time.now + (60*60)).strftime("%H:%M")
  end

  def confirmation(specific_order)
    # Twilio number +441442796264
    msg = "Thank you! Your order of £#{sum(specific_order)}
          was placed and will be delivered before #{deliver_time}"
    text.send_confirmation(msg) if text
  end

  def sum(specific_order)
    specific_order.show_sum
  end

end
