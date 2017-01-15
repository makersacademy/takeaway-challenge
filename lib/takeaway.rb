require_relative 'menu'
require_relative 'message'

class TakeAway
  attr_reader :items
  attr_reader :checkout


  def initialize(message = Message.new)
    @message = message
    @menu = Menu.new
    @items =  Hash.new(0)
  end

  def read_menu
    @menu.dishes
  end

  def order(dish, quantity=1)
     add_dish(dish,quantity)
    "#{quantity}x #{dish}(s) added to your basket."
  end

  def basket_summary
    @items.map {|k,v| "#{k} x#{v} = £#{read_menu[k] * v}"}.join(", ")
  end

  def total_price
    @checkout = @items.map {|k,v| read_menu[k] * v}.reduce(:+)
    "Total: £#{@checkout}"
  end

  def complete_order(customer_total)
    delivery_time = (Time.now + (1*60*60)).strftime("%H:%M")
    raise "The total you enter does not match checkout" if @checkout != customer_total
    @message.send_text("Thank you for your order: #{total_price}.It will be delivered before #{delivery_time}")
  end

  private

  def add_dish(dish, quantity)
    @items[dish] += quantity
  end
end
