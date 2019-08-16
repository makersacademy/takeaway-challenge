require_relative './menu'
require_relative './dish'
require_relative './order'
require_relative './basket'
require_relative './sms'

#check menu, add dish to basket, place order
class UserInterface

  def initialize(basket_class = Basket, platform_class = Sms, confirmation_class = Confirmation, order_class = Order)
    @basket = basket_class.new
    @platform_class = platform_class
    @confirmation_class = confirmation_class
    @order_class = order_class
  end

  def show_menu(menu)
    menu.list
  end

  def add_to_basket(menu, dish_name, quantity)
    new_order = @order_class.new(menu, dish_name, quantity)
    raise "Dish isn't on menu" if new_order.order.nil?

    new_order.order.each { |dish| @basket.add(dish) }
  end

  def checkout(total)
    raise 'Basket empty' if @basket.dishes.empty?

    raise 'Incorrect amount' if total != @basket.total

    @platform_class.new.send(@confirmation_class.new.message)
    @basket.empty
  end
end
