class Menu

  def initialize(dish_class=Dish)
    @dish_class = dish_class
    @dish_array = []
  end

  def add_dish(name, price)
    @dish_array << @dish_class.new(name, price)
  end

  def print(puts_out=true)
    if puts_out
      puts assemble_menu
    else
      assemble_menu
    end
  end

  def select(i, n)
    Array.new(n) { @dish_array[i - 1] }
  end

  private

  def assemble_menu
    menu_string = ""
    @dish_array.each_with_index do |dish, i|
      menu_string += "#{i + 1}. #{dish.print}\n"
    end
    menu_string
  end

end
