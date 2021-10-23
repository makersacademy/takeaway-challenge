require 'menu'
require 'read'

class Ui
  attr_reader :menu, :read, :write

  def initialize(menu = Menu.new([]), read = Read.new, write = Write.new)
    @menu = menu
    @read = read
    @write = write
  end

  def display_menu
    raise "empty menu" if @menu.empty?
    a = @menu.display_dishes
    @write.set_write(a)
  end

  def select_dish
    puts "Select Dish (number)"
    @read.get_read.to_i
  end
end
