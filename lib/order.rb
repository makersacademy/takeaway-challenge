class Order
  attr_reader :items
  def initialize(menu)
    @items = []
    @menu = menu
  end

  def create_dish(menu_id, dish = Dish.new)
    selection = @menu.data.select{ |dish| dish[:id] == menu_id }.first
    dish.set_all(selection)
    dish
  end

  def build_order(id_array)
   @items = id_array.map{ |id| create_dish(id) }
  end
end
