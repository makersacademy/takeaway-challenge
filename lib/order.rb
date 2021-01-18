require_relative 'menu'
require_relative 'basket'
require_relative 'printer'

class Order

  def initialize
    @basket = Basket.new
    @menu = Menu.new
    @printer = Printer.new(@menu.col_width)
    start
  end

  def start
    puts "Welcome to Dang's Thai Restaurant!",""
    @printer.print(@menu.print)
  end

  def add(index)
    @basket.add(@menu.lookup_item(index - 1))
  end

  def remove(index)
    @basket.remove(index - 1)
  end

  def show_basket
    @printer.print(@basket.print)
  end

  def checkout
  end

  def place
  end

  def confirm
  end

end
