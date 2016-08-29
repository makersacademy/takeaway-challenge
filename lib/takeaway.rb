
require_relative 'order'
require_relative 'menu'
require_relative 'message'

class Takeaway

  attr_reader :menu, :order #maybe these should be private

  def initialize(menu = Menu.new,order = Order.new(menu),message = Message.new)
    @message = message
    @menu = menu
    @order = order
  end

  def show_menu
    menu.print_menu
  end

  def place_order(meal,quantity=1)
    message = "#{meal.capitalize} is not on the menu"
    fail message unless menu.has_meal?(meal)
    @order.add_meals(meal,quantity)
  end

  def basket_contents
    @order.basket_empty? ? "Basket is empty" : @order.basket
  end

  def confirm_order
    fail 'No orders have been added' if @order.basket_empty?
    @message.send_text if price_is_correct?
  end


  private

  def price_is_correct?
    @order.current_total == @order.basket_total
  end

end
