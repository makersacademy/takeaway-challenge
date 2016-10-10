require_relative 'menu'

class Validation

  attr_reader :menu, :orders_array

  def initialize(order, menu, interface)
    @order = order
    @menu = menu
    @interface = interface
  end
  
  def validate_selection(dish_selection)
    if dish_selection == "exit"
      @interface.terminate
    elsif dish_selection.to_i > 0
      if dish_selection.to_i <= @menu.menu.length
        @order.add_dish(dish_selection)
      else
        invalid_entry("dish")
      end
    else
      invalid_entry("dish")
    end
  end

  def validate_quantity(dish_quantity)
    if dish_quantity > 10
      invalid_entry("quantity")
    else
      @order.add_quantity(dish_quantity)
    end
  end

  def invalid_entry(input)
    puts "Not a valid #{input}, please try again"
    if input == "dish"
      select_dish
    elsif input == "quantity"
      select_quantity
    end
  end

  def evaluate_input(selection)
    case selection
    when "1" then @interface.select_dish
    when "2" then @order.order_summary
    else
      puts "Not a valid input"
      @interface.add_or_review
    end
  end

  def confirmed?(confirmation)
    case confirmation
    when "1" then @order.send_confirmation
    when "2"then @order.reset_order
    when "3" then exit
    else
      puts "Not a valid entry, try again"
      @interface.confirm_order
    end
  end

end
