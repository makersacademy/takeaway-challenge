class Order
  attr_reader :menu, :selected_dishes

  def initialize(menu)
    @menu = menu
    @food_items = menu.food_items
    @selected_dishes = []
  end

  def select_dish(item)
    @food_items.each do |food, price|
      @selected_dishes << food if food == item
    end
  end

  def view_selected_dishes
    puts selected_dishes
  end
end
