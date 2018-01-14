require_relative 'menu'
require_relative 'dish'
require_relative 'dish_printer'
require_relative 'menu_printer'
require_relative 'shopping_cart'
require_relative 'order'
require_relative 'dish_list_printer'
require_relative 'order_printer'
require_relative 'twilio_service'


class Takeaway
  attr_reader :menu, :shopping_cart

  def initialize
    @menu = Menu.new("breakfast menu")
    @menu.add(Dish.new("Pancakes", 3))
        .add(Dish.new("Waffles", 2))
        .add(Dish.new("Full English", 6))
        .add(Dish.new("French Toast", 4))
        .add(Dish.new("Poached Eggs", 3))
        .add(Dish.new("Cereal", 2))
        .add(Dish.new("Fruit Salad", 3))
        .add(Dish.new("Croissant", 1))
        .add(Dish.new("Tea", 1))
        .add(Dish.new("Coffee", 2))
    dish_printer = DishPrinter.new
    dish_list_printer = DishListPrinter.new(dish_printer)
    @menu_printer = MenuPrinter.new(dish_list_printer)
    @order_printer = OrderPrinter.new(dish_list_printer)
    @shopping_cart = ShoppingCart.new
    @twilio_service = TwilioService.new
  end

  def display_menu
    @menu_printer.print(@menu)
  end

  def add_to_cart(item)
    @shopping_cart.add(@menu.dish_by_name(item))
  end

  def remove_from_cart(item)
    @shopping_cart.remove(@menu.dish_by_name(item))
  end

  def checkout(recipient_number)
    @order = Order.new(@shopping_cart.items)
    @shopping_cart.empty
    @order_printer.print(@order)
    message_body = "Thank you! Your order was placed and will be delivered before #{(@order.time + (60 * 60)).strftime('%H:%M')}"
    @twilio_service.send_sms(recipient_number, message_body)
    @order
  end
end
