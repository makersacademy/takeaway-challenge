require_relative 'shopping_cart'

class ShoppingCartPrinter
  def initialize(dish_list_printer)
    @dish_list_printer = dish_list_printer
  end

  def print(shopping_cart)
    raise "Invalid shopping cart" unless shopping_cart.is_a? ShoppingCart
    @dish_list_printer.print(shopping_cart.items)
    puts "Total...£%.2f" % shopping_cart.total
  end
end
