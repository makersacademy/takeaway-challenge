require_relative './menu'
require_relative './dish_printer'

class Order

  attr_reader :order_dishes, :completed, :menu

  def initialize(menu=Menu.new, printer=DishPrinter.new)
    @menu = menu
    @order_dishes = []
    @printer = printer
    @completed = false
  end

  def add_dish(i, n)
    raise Exception.new('Items cannot be added after order is completed!') if @completed
    @order_dishes << @menu.select(i,n)
  end

  def show_menu(puts_out=true)
    @menu.print(puts_out)
  end

  def show_order(puts_out=true)
    if puts_out
      puts @printer.print(@order_dishes)
    else
      @printer.print(@order_dishes)
    end
  end

  def total
    @order_dishes.reduce(0.0) do |sum, dish|
      sum + dish.price
    end
  end

  def complete
    @completed = true
  end

  def change_menu(menu)
    @menu = menu
  end 

end
