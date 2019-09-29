
class Printer
  def initialize(output = STDOUT)
    @output = output
  end
  
  def print_checked_total(status)
    case status
    when :correct
      @output.puts("Order total confirmed correct.")
    when :incorrect
      @output.puts("Total incorrect! Something went wrong, please start again")
    when :empty
      @output.puts("Order empty, choose option 2 to add dishes to your order")
    end
  end

  def print_menu(menu)
    @output.puts "Here's the menu, please enter which items you'd like:"
    print_numbered_list(menu)
  end

  def print_welcome
    @output.puts "Welcome to Link's Wild Delivery!"
  end

  def print_invalid_selection
    @output.puts 'Invalid selection, try again or Enter to finish.'
  end

  def print_main_menu(list)
    list.each_with_index do |item, index|
      @output.puts prefixer(index) + item
    end
    @output.puts "Please make a selection:"
  end

  def print_confirmation
    @output.puts "Added to order."
    @output.puts "Anything else? Enter to finish adding items."
  end

  def print_order(order, total)
    order.uniq.each do |dish|
      quantity = order.count(dish)
      @output.puts "#{quantity}  x  " + format_dish(dish)
    end
    @output.puts "Total:" + "💎".rjust(32) + total.to_s.rjust(3)
  end

  def print_order_submission
    @output.puts "Thanks, your order has been submitted!"
    @output.puts "You should receive an SMS with delivery information shortly"
  end

  def print_exit
    @output.puts "Sorry to see you go! Come back soon!"
  end

  private

  def print_numbered_list(list)
    list.each_with_index do |dish, index|
      @output.puts prefixer(index) + format_dish(dish)
    end
  end

  def format_dish(dish)
    "#{dish.name.ljust(30)} 💎  #{dish.cost}"
  end

  def prefixer(index)
    "#{index + 1}.".ljust(4)
  end
end
