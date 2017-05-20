
# This prints out nicely formatted menus or orders which are easy to read.
class Printer

  def print(input)
    if input.is_a?(Menu)
      print_menu(input)
    elsif input.is_a?(Order)
      print_order(input)
    end
  end

  private

  def print_menu(menu)
    puts '---'
    menu.dishes.each_with_index { |item, index|
      puts "#{index + 1}. #{item.name} - £#{item.price}\n#{item.description}\n---"
    }
  end

  def print_order(order)
    puts "Order no. #{object.order_number}:"
    order.order.each { |item, quantity|
      puts "#{item.name} x #{quantity}"
    }
    puts "---\nOrder total: #{object.total}"
  end

end
