class Menu
  def initialize(dish_class = Dish)
    @dish_class = dish_class
    @menu_items = []
  end

  def view
    menu = ""
    @menu_items.each do |dish|
      menu << dish.display
    end
    menu
  end

  def add(dish)
      @menu_items << dish
  end
end
