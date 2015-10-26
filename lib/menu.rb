class Menu
  attr_reader :dishes

  def initialize(dish_klass,menu_items)
    @dish_klass = dish_klass
    @menu_items = menu_items
    @dishes = []
    menu_gen
  end

  def select_dish(dish)
    @dishes.select {|menu_item| menu_item.name == dish}
  end

private
  attr_reader :dish_klass
  def menu_gen
    @menu_items.each { |dish| dishes << dish_klass.new(dish[:name],dish[:price])}
  end

end