
require_relative 'order'
require_relative 'menu'
#require_relative 'message'

class Takeaway

attr_reader :menu, :order #maybe these should be private

  def initialize(menu = Menu.new) #message = Message.new)
    #@message = message
    @menu = menu
    @order = nil
  end

  def show_menu
    menu.print_menu
  end

  def place_order(meal,quantity=1)
    fail "#{meal.capitalize} is not on the menu" unless menu.has_meal?(meal)
    @order = Order.new(@menu.meals_list) if @order.nil?
    @order.add_meals(meal,quantity)
  end

  def basket_contents
    @order.nil? ? "Basket is empty" : @order.basket
  end

   def confirm_order
     fail 'No orders have been added' if @order.nil?
  #   @message.send_text if price_is_correct?
   end


private

  def price_is_correct?
    @order.order_total == @order.basket_total
  end

end
