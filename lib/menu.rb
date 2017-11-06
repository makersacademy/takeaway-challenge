require_relative 'methods'

class Menu

  def initialize(dishes = [])
    @dishes = dishes
  end

  def view_full_menu
    menu_number = 1
    @dishes.each do |dish|
      puts "#{menu_number}. #{dish.name.capitalize}:"
      dish.options.each do |option, price|
        puts "    #{symbol_to_string(option).capitalize}: £#{price}"
      end
      puts
      menu_number += 1
    end
  end

  def select_dish(dish_name, dish_option)
    selected_dish = @dishes.select { |dish|
      dish.name.downcase == dish_name.downcase
    }.first
    price = selected_dish.get_price(dish_option)
    { string_to_symbol("#{dish_option} #{dish_name}") => price }
  end

end
