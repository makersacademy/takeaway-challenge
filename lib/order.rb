require_relative "menu"
require_relative "calculator"
require_relative "order"

class Order

  attr_reader :complete_order, :food_options, :calculator, :total, :print_class

  def initialize(food_options = Menu.new.food_options, calculator = Calculator.new, print_class = Printer.new)
    @complete_order = []
    @food_options = food_options
    @calculator = calculator
    @total = 0
    @print_class = print_class
  end

  def new_item(item, quantity)
    counter = 0
    while true
    food_options.map{ |hash|
      if item == hash[:Dish]
        @complete_order << hash
        counter += 1
      end
    }
    break if counter == quantity

    end
  end

  def total
    @total = @calculator.calculate_total(complete_order)
  end

  def print_order
    @print_class.print_bill(@complete_order, @total)
  end

end
