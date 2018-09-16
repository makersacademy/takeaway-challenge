require_relative "menu"
require_relative "printer"
require_relative "text"
require_relative "calculator"

class Order

  attr_reader :complete_order, :food_options, :calculator, :total, :print_class, :text_class

  def initialize(food_options = Menu.new.food_options, calculator = Calculator.new, print_class = Printer.new, text_class = Text.new)
    @complete_order = []
    @food_options = food_options
    @calculator = calculator
    @total = 0
    @print_class = print_class
    @text_class = text_class
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


  def place_order(customer_confirm_total)
    if customer_confirm_total != total
      raise "I'm sorry that total is wrong, enter your total again or place a new order"
    else
      @text_class.confirmation
    end

  end


end
