class Menu
  def initialize(dish_class = Dish)
    @dish_class = dish_class
    @menu_items = []
  end

  # def compose(menu)
  #   menu_items = menu.map { |dish| dish_class.new(dish)  }
  #   menu_items << dish_class.new
  # end

  def view
    menu = ""
    @menu_items.each do |dish|
      menu << "#{dish.display}\n"
    end
    menu
  end

  def add(dish)
    @menu_items << dish
  end
end
