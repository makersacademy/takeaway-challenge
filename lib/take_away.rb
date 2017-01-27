require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class TakeAway

  MAX_QUANTITY = 20

  attr_reader :order

  def initialize(filename = 'menu.csv')
    @filename = filename
    load_menu_from_file(filename)
    @order = Order.new
  end

  def read_menu(filename = @filename)
    load_menu_from_file(filename)
    @menu.print_menu
  end

  def add_to_order(menu_number, quantity)
    asserts_dish_on_menu!(menu_number)
    @order.add_hash_to_order({menu_number => quantity})
    menu_hash = @menu.dishes
    puts "#{quantity}x #{menu_hash[menu_number].name}(s) added to your busket."
  end

  def place_order
    @order.finalize_order
  end

  def show_order_details
    asserts_order_placed!
    @order.print_order
  end

  private

  def asserts_dish_on_menu!(menu_number)
    menu_hash = @menu.dishes
    raise "Please select dish from the menu." if menu_hash.length < menu_number
  end

  def load_menu_from_file(filename)
    @menu = Menu.new(filename)
  end

  def asserts_order_placed!
    raise "Order can't be found: looks like nothing has been ordered yet. Please add to the order first." if @order.total == nil
  end

end

# def communication_with_the_customer
#   order_information = Hash.new
#   puts "What would you like to order? Type in the number of a dish from the menu."
#   number = gets.chomp.to_i
#   while number != -1
#     while !number.is_a?(Integer) or number < 1 or number > @menu_hash.length do
#       puts "Please give a dish from the menu you have seen."
#       number = gets.chomp.to_i
#     end
#     puts "How much of #{@menu_hash[number].name}would you like?"
#     quantity = gets.chomp.to_i
#     while !quantity.is_a?(Integer) or quantity < 1 or quantity > MAX_QUANTITY do
#       puts "Please give a resonable quantity."
#       quantity = gets.chomp.to_i
#     end
#     puts "Would you like anything else? Type '-1' if you are done"
#     puts "Otherwise type in the number of a dish from the menu."
#     order_information.store(number,quantity)
#     number = gets.chomp.to_i
#   end
#   order_information
# end

# http://stackoverflow.com/questions/29323771/rspec-test-for-a-method-that-contains-gets-chomp
