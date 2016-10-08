require_relative 'menu'

class Validation

  attr_reader :menu

  def initialize(order, menu, interface)
    @order = order
    @menu = menu
    @interface = interface
  end

  def validate_selection(dish_selection)
    if dish_selection == "exit"
      puts "Thank you, goodbye"
      exit
    elsif dish_selection.to_i > 0
      if dish_selection.to_i <= @menu.menu.length
        @order.current_selection << dish_selection.to_i
        @interface.select_quantity
      else
        invalid_input
      end
    else
      invalid_input
    end
  end

  def invalid_input
    puts "Not a valid input"
    @interface.select_dish
  end

  def validate_quantity(dish_quantity)
    if dish_quantity > 10
      puts "Please enter a value between 1 and 10"
      @interface.select_quantity
    else
      @order.current_selection << dish_quantity
      @order.calculate_subtotal
    end
  end

  def evaluate_input(selection)
    case selection
    when "1"
      @interface.select_dish
    when "2"
      @order.order_summary
    else
      "Not a valid input"
      @interface.add_or_review
    end
  end

  def confirmed?(confirmation)
    if confirmation == "y"
      @order.send_confirmation
    elsif confirmation == "n"
      @order.orders_array = []
      @order.running_total = 0
      @interface.select_dish #spawn new instance of order
    else
      puts "Not a valid entry, try again"
      @interface.confirm_order
    end
  end

end
