require_relative './item_printer'
require_relative './dishlist'
require_relative './menu_handler'
require_relative './order'

class Orderer

  attr_reader :order, :dishlist
  include Item_printer

  def initialize(menu_handler = Menu_handler.new, dishlist_class = Dishlist, order_class = Order)
    @menu_handler = menu_handler
    print_menu_summaries
    category = select_menu
    @dishlist = dishlist_class.new(category: category, menu_handler: menu_handler)
    @order = order_class.new(category)
  end

  def show_menu
    print_menu_items
  end

  def add(item_num, quantity)
    raise "Not a valid dish number" if !valid_dish?(item_num)
    order.add(@dishlist.dishes[item_num - 1 ], quantity)
  end


  private

  def print_menu_summaries
    ordered_print(@menu_handler.file_summaries)
  end

  def select_menu
    puts 'Please enter the number for the menu you want'
    while input = STDIN.gets.chomp
      options = (1..@menu_handler.file_summaries.length).to_a.map { |num| num.to_s }
      break if options.include?(input)
      puts "Invalid entry"
    end
    @menu_handler.file_summaries[input.to_i - 1][:category]
  end

  def print_menu_items
    ordered_print(@dishlist.dishes)
  end

  def valid_dish?(num)
    num.is_a?(Integer) && num <= @dishlist.dishes.length
  end

end
