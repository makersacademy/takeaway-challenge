
# This prints out menus in a nicely formatted and easy to read way for customers.
class Printer

  def print_menu(menu)
    menu.dishes.each_with_index { |item, index|
      puts "#{index + 1}. #{item.name} - £#{item.price}\n#{item.description}"
    }
  end
end
