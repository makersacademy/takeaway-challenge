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
    @write.write(@menu.display_dishes)
  end

  def select_dish
    puts "Select Dish (number)"
    @read.read_chomp.to_i
  end
end
