# Menu class
class TakeawayMenu
  def initialize
    @menu_options = MenuHeader.new
    menu_header = MenuHeader.new
    menu_header.print_header
    @line_length = 61
    splash = SplashScreen.new
    splash.animation
    menu(:main)
  end

  def menu_arrays(menu)
    return ["Veggie", "Meaty", "Fishy", "Which category would you like to see?"] if menu == :main
  end

  def menu(menu)
    case menu
    when :main
      menu_arrays(:main).each_with_index { |item, index| puts '|' + index + item.center(40) + '|' }
      puts '-' * @line_length
      option = gets.strip
      @menu_options.options(:main, option)
    end
  end
end

class MenuHeader
  def print_header
    system 'clear'
    puts '-' * @line_length
    puts '|'.ljust(22) + "Slice, slice baby".center(10) + "|".rjust(22)
    puts '-' * @line_length
  end
end

class MenuOptions

  def options(menu, option)

  end
end
