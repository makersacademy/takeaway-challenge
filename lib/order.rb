class Order

  def initialize(menu=Menu.new)
    @menu = menu
    @order_dishes = []
  end

  def add_dish(i)

  end

  def show_menu(puts_out)
    @menu.print(puts_out)
  end

  def show_order(puts_out)
    if puts_out
      puts assemble_order
    else
      assemble_order
    end
  end

  private

  def assemble_order
    order_string = ""
    @dish_array.each_with_index do |dish, i|
      menu_string += "#{i + 1}. #{dish.print}\n"
    end
    menu_string
  end

end
