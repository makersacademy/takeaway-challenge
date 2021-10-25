require 'menu'
require 'read'

class Ui
  attr_reader :menu, :read, :write, :complete

  def initialize(menu = Menu.new([]), read = Read.new, write = Write.new)
    @menu = menu
    @read = read
    @write = write
    @complete = false
  end

  def display_menu
    raise "empty menu" if @menu.empty?
    @write.write(@menu.display_dishes)
  end

  def select_dish
    puts "Select Dish (number)"
    read_input = @read.read_chomp
    @complete = read_input == 'q'
    read_input = read_input.to_i unless complete
    read_input
  end
end
