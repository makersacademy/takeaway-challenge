
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
    menu.dishes.each_with_index do |item, index|
      puts "#{index + 1}. #{item.name} - £#{item.price}\n#{item.description}\n---"
    end
  end

  def print_order(order)
    puts "Order no. #{order.order_number}:\n------"
    order.basket.each { |order_item| puts "• #{order_item[0].name} x #{order_item[1]}" }
    puts '------'
    puts "Sub-Total: £#{order.total}"
  end

end
