require_relative 'menu'
require_relative 'order_display'

class Order

  attr_reader :menu_display_class, :analyzed_order, :menu, :order_display_class
  ORDER_MESSAGE = 'Place order by entering the number of the dish, a comma, and the quantity, e.g. \'3, 4\'. New line for new item.  When order is complete simply press return again.'

  def initialize(menu_display_class: MenuDisplay, menu: Menu.new, order_display_class: OrderDisplay)
    @menu_display_class = menu_display_class
    @menu = menu
    @analyzed_order = Hash.new
    @order_display_class = order_display_class
  end

  def take_order
    puts menu_display_class.new.list_menu(hash: menu.hash)
    puts ORDER_MESSAGE
    get_input
    puts order_display_class.new.print_order(analyzed_order)
  end

  def get_input
    loop do
      line = STDIN.gets.chomp
      break if line == ''
      if right_format?(line)
        analyze(line)
      else
        puts 'Oops! You misspelt that entry.', ORDER_MESSAGE
      end
    end
  end

  def right_format?(line)
    line =~ /\d+,\s\d+/
  end

  def analyze(line)
    @analyzed_order[menu_nouns(line)] = quantity(line)
  end

  def menu_nouns(line)
    number_input = line.split(', ')[0].to_i
    menu_entry = menu.hash.keys[number_input - 1]
  end

  private

  def quantity(line)
    line.split(', ')[1].to_i
  end

end
