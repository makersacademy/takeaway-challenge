require_relative 'menu'
require_relative 'order'
require_relative 'message'

class TakeAway

  MAX_QUANTITY = 20

  attr_reader :order, :order_hash

  def initialize(filename = 'menu.csv')
    @filename = filename
    load_menu_from_the_file(filename)
    @order_hash = Hash.new 0
  end

  def read_menu(filename = @filename)
    load_menu_from_the_file(filename)
    @menu.print_menu
  end

  def add_to_order(menu_number, quantity)
    is_dish_on_the_menu?(menu_number)
    update_order(menu_number, quantity)
    puts "#{quantity}x #{@menu_hash[menu_number].name}(s) added to your busket."
  end

  def place_order(order_hash = @order_hash)
    error_if_no_order_info(order_hash)
    @order = Order.new(order_hash, @menu_hash)
    finalize_order
  end

  def order_details
    error_if_order_not_placed
    @order.print_order
  end

  private

  def finalize_order
    send_sms
    puts "You have placed your order, total: $#{@order.total}."
    @order.total
  end

  def send_sms
    SMS.new(@order.total).send_sms
  end

  def is_dish_on_the_menu?(menu_number)
    raise "Please select dish from the menu" unless @menu.dishes.key?(menu_number)
  end

  def update_order(menu_number, quantity)
    @order_hash.key?(menu_number) ? @order_hash[key] += quantity : @order_hash.store(menu_number,quantity)
  end

  def load_menu_from_the_file(filename)
    @menu = Menu.new(filename)
    @menu_hash = @menu.dishes
  end

  def error_if_no_order_info(order_hash)
    raise "Can't place order without information about the order: please provide what you would like to order in acceptable format." if !order_hash
  end

  def error_if_order_not_placed
    raise "Order can't be found: looks like it hasn't been placed yet. Please place the order first." if !@order
  end

end

# def communication_with_the_customer
#   order_hash = Hash.new
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
#     order_hash.store(number,quantity)
#     number = gets.chomp.to_i
#   end
#   order_hash
# end
