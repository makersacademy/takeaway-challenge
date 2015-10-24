class Menu
  attr_reader :dish_klass, :menu, :dish
  attr_accessor :menu_id

  def initialize dish_klass=Dish
    @dish_klass = dish_klass
    @menu_id = 0
    @menu = []
  end

  def add_dish name,price
    self.menu_id += 1
    @dish = dish_klass.new menu_id
    dish.name = name
    dish.price = price
    menu << dish
  end

  def list_dishes
    menu
  end

  def read menu_id
    menu[menu.index {|i| i.menu_id == menu_id}]
  end

end