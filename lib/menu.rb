# Menu class
class TakeawayMenu
  def initialize
    splash_screen
  end

  def menu_arrays(menu)
    case menu
    when :main
      return ["Veggie", "Meaty", "Fishy"]
    when :veggie

    when :meat

    when :fish

    else

    end
  end

  def main_menu(menu)
    case menu
    when :main
      menu_arrays(:main).each_with_index { |item, index| puts "|" + index + item.center(40) + "|" }
      puts "Which category would you like to see?"
    end
  end
end
