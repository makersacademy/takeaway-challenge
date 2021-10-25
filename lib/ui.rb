require 'menu'
require 'read'

class Ui
  attr_reader :menu, :read, :write, :complete, :order

  def initialize(menu = Menu.new([]), read = Read.new, write = Write.new, order = Order.new)
    @menu = menu
    @read = read
    @write = write
    @complete = false
    @order = order
  end

  def display_menu
    raise "empty menu" if @menu.empty?
    @write.write(@menu.display_dishes)
  end

  def select_dish
    puts "Select Dish (number)"
    read_input = @read.read_chomp
    @complete = read_input == 'q'
    if complete
      @order.complete_order
      @order.text("completed order")
    end
    read_input = read_input.to_i unless complete
    read_input
  end
end
