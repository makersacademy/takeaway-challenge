
require_relative "printer"
require_relative "food"

# Understands how to process a menu of food.

class Menu

  attr_reader :dishes

  include Food

  def initialize(printer = Printer.new)
    @printer = printer
    @dishes = RESTAURANT_FOOD
  end

  def show_food
    printer.print_all(dishes)
  end

  def has?(food)
    dishes.find { |dish, price| dish == food.to_sym }
  end

  private

  attr_reader :printer

end
