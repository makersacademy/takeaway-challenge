require_relative './item_printer'
require_relative './dishlist'
require_relative './menu_handler'
require_relative './order'
require_relative './order_verifier'

class Orderer

  attr_reader :order, :dishlist
  include ItemPrinter

  def initialize(menu_handler = MenuHandler.new, dishlist_class = Dishlist, order_class = Order, order_verifier_class = OrderVerifier)
    @menu_handler = menu_handler
    print_menu_summaries
    category = select_menu
    @dishlist = dishlist_class.new(category: category, menu_handler: menu_handler)
    @order = order_class.new(category)
    @order_verifier = order_verifier_class.new
  end

  def show_menu
    print_menu_items
  end

  def add(item_num, quantity)
    raise "Not a valid dish number" unless valid_dish?(item_num)
    order.add(@dishlist.dishes[item_num - 1], quantity)
  end

  def show_order
    @order.print_order
  end

  def place_order
    @order_verifier.process_order(order)
  end

  private

  def print_menu_summaries
    ordered_print(@menu_handler.file_summaries)
  end

  def select_menu
    puts 'Please enter the number for the menu you want'
    while (input = STDIN.gets.chomp)
      options = (1..@menu_handler.file_summaries.length).to_a.map { |num| num.to_s }
      break if options.include?(input)
      puts "Invalid entry"
    end
    @menu_handler.file_summaries[input.to_i - 1][:category]
  end

  def print_menu_items
    ordered_print(dishlist.dishes)
  end

  def valid_dish?(num)
    num.is_a?(Integer) && num <= dishlist.dishes.length && num > 0
  end

end
