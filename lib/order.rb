require_relative 'menu'
require_relative 'order_display'
require_relative 'totalizer'
require_relative 'phone'

class Order

  attr_reader :menu_display_class, :analyzed_order,
  :menu, :order_display_class, :phone_class,
  :totalizer_class, :order_confirmed
  ORDER_MESSAGE = 'Place order by entering the number of the dish, a comma,
  and the quantity, e.g. \'3, 4\'. New line for new item.  When order is
  complete enter what you think the total should be, to confirm.'

  def initialize(
    menu_display_class:               MenuDisplay,
    menu:                             Menu.new,
    order_display_class:              OrderDisplay,
    totalizer_class:                  Totalizer,
    phone_class:                      Phone
    )
    @menu_display_class = menu_display_class
    @menu = menu
    @analyzed_order = Hash.new
    @order_display_class = order_display_class
    @order_confirmed = false
    @totalizer_class = totalizer_class
    @phone_class = phone_class
  end

  def take_order
    puts menu_display_class.new.list_menu(hash: menu.hash)
    puts ORDER_MESSAGE
    take_input
    puts order_display_class.new.print_order(hash: analyzed_order)
  end

  def take_input
    loop do
      line = STDIN.gets.chomp
      break if line == ''
      parse_input(line)
      break if order_confirmed
    end
  end

  def analyze(line)
    @analyzed_order[menu_nouns(line)] = quantity(line)
  end

  def menu_nouns(line)
    number_input = line.split(', ')[0].to_i
    menu.hash.keys[number_input - 1]
  end

  def confirm_order
    message = "Thank you! Your order was placed and will be
    delivered before #{Time.new + 3600}"
    phone_class.new.send_text(message)
    @order_confirmed = true
  end

  private

  def parse_input(line)
    if right_format?(line)
      analyze(line)
    elsif total_format?(line)
      parse_total(line)
    else
      puts 'Oops! You misspelt that entry.', ORDER_MESSAGE
    end
  end

  def parse_total(line)
    if line.to_f == correct_total.to_f
      confirm_order
    else
      @analyzed_order = Hash.new
      puts 'Oops! You gave a wrong total.', ORDER_MESSAGE
    end
  end

  def correct_total
    totalizer_class.new(order_hash: analyzed_order, menu_hash: menu.hash).total
  end

  def quantity(line)
    line.split(', ')[1].to_i
  end

  def right_format?(line)
    line =~ /\d+,\s\d+/
  end

  def total_format?(line)
    line =~ /\d+.*\d*/
  end
end
