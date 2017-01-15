require_relative 'menu'
require_relative 'order'
require_relative 'message'

class TakeAway

  MAX_QUANTITY = 20

  attr_reader :order, :order_hash

  def initialize(filename = 'menu.csv')
    menu = Menu.new(filename)
    @menu_hash = menu.dishes
    @order_hash = Hash.new 0
  end

  def read_menu(filename = 'menu.csv')
    menu = Menu.new(filename)
    menu.print_menu
    @menu_hash = menu.dishes
  end

  # def place_order_interface
  #   order_hash = communication_with_the_customer
  #   place_order(order_hash)
  # end

  def add_to_order(menu_number, quantity)
    puts "#{quantity}x #{@menu_hash[menu_number].name}(s) added to your busket."
    @order_hash.key?(menu_number) ? @order_hash[key] += quantity : @order_hash.store(menu_number,quantity)
  end

  def place_order(order_hash = @order_hash)
    error_if_no_order_info(order_hash)
    @order = Order.new(order_hash, @menu_hash)
    m = Message.new(@order.total)
    m.send_sms
    @order.total
  end

  def order_details
    error_if_order_not_placed
    @order.print_order
  end

  private

  def error_if_no_order_info(order_hash)
    raise "Can't place order without information about the order: please provide what you would like to order in acceptable format." if !order_hash
  end

  def error_if_order_not_placed
    raise "Order can't be found: looks like it hasn't been placed yet. Please place the order first." if !@order
  end
  #
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

end
