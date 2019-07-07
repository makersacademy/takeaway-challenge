class Menu

  def initialize(dishes = {})
    @dishes = dishes
  end

  def price(dish)
    "£#{'%.2f' % @dishes[dish.to_sym]}"
  end

  def cost(dish)
    @dishes[dish]
  end

  def get_dish(dish_name)
    @dishes
  end

  def view
    menu_items = ""
    @dishes.each { |dish,price| menu_items+=("#{dish} - £#{'%.2f' % price}\n") }
    print menu_items
    menu_items
  end

end
