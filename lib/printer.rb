require_relative "order"

class Printer

  def format(something_to_print)
    something_to_print.each { |hash|
      puts "#{hash[:Dish]}: £#{hash[:Price]}"
    }
  end

  def print_bill(complete_order, total)
    complete_order.each { |hash|
      puts "#{hash[:Dish]}: £#{hash[:Price]}"
    }
    puts "Total: £#{total}"
  end

end
