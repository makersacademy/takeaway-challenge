
# This prints out menus in a nicely formatted and easy to read way for customers.
class Printer

  def print_menu(menu)
    puts '---'
    menu.dishes.each_with_index { |item, index|
      puts "#{index + 1}. #{item.name} - £#{item.price}\n#{item.description}\n---"
    }
  end
end
