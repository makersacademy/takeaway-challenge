class Takeaway

  attr_accessor :order

  def initialize
    @menu = Menu.new
    # @menu.print
    @order = []
    @order_finished = false
  end

  def take_order
    while true do
      get_menu_item
      break if @order_finished == true
      get_quantity
    end
  end

  def print_receipt
    total = 0
    @order.each do |line|
      line_total = line[:count] * line[:cost]
      puts "#{line[:desc]} @ #{line[:cost]} x #{line[:count]}   : £#{line_total}0"
      total += line_total
    end
    puts "-----------------------------------"
    puts "Total             : £#{total}0"
  end

  private

  def get_menu_item
    puts
    puts "What would you like to order?"
    puts "Please enter a menu line number (e.g. 1 for chips) or push enter to place your order."
    @item_index = gets.chomp.to_i - 1
    @order_finished = true if @item_index == -1
  end

  def get_quantity
    @item = @menu.menu_list[@item_index]
    puts "OK that's #{@item[:desc]}. How many of those would you like?"
    @item[:count] = gets.chomp.to_i
    @order << @item
  end
end
