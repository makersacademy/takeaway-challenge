require_relative 'menu'
require_relative 'basket'
require_relative 'printer'
require_relative 'messenger'

class Order

  def initialize
    @basket = Basket.new
    @menu = Menu.new
    @printer = Printer.new(@menu.col_width)
    @messenger = Messenger.new
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
    @printer.print(@basket.print)
    puts "","Your order total is #{'£%.2f' % @basket.total}."
    confirm
  end

  def confirm
    @messenger.confirm
  end

end
