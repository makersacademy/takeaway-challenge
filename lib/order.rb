require_relative 'basket'
require_relative 'menu'
require_relative 'message'
class Order
  def initialize
    @menu = Menu.new
    @basket = Basket.new
    @message = Message.new
  end

  def print_menu
    @menu.print_menu
  end

  def add_to_basket(*dishes)
    n = 0
    dishes.each do
      @basket.add_summary(dishes[n])
      @basket.add_price(@menu.menu[dishes[n]])
      n =+ 1
    end
    p "#{dishes} added to your menu"
  end

  def total
    "£#{@basket.price}"
  end

  def summary
    @basket.summary.join(", ")
  end

  def place_order(amount)
    raise "Sorry, that amount does not match your order total, please try again" unless @basket.is_correct?(amount)
     send_message(summary)
     "Order placed - please see text message for delivery details"
   end

  private

  def send_message(message)
    @message.send_message(message)
  end
end
