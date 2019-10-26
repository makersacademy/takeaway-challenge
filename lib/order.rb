class Order

  attr_reader :list, :dish_selection, :quantity, :total, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @list = []
    @total = 0
  end

  def place(dish_selection, quantity)
    @list << { dish_selection: dish_selection, quantity: quantity }
    @total += menu_list[dish_selection] * quantity
    @dish_selection = dish_selection
    @quantity = quantity
  end

private

  def menu_list
    @menu.list
  end

end
