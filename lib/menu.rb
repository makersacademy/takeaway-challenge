class Menu

  EMPTY_ERR = 'Menu is empty'
  DUPE_ERR = 'A dish with this name already exists'
  NO_DISH_ERR = 'This dish isn\'t on the menu'

  def initialize dish_class = Dish
    @dish_class = dish_class
    @dishes = Array.new
    @menu = Hash.new
  end

  def view
    fail EMPTY_ERR if @dishes.empty?
    @menu
  end

  def add dish
    fail DUPE_ERR if @menu.has_key?(dish.name.upcase)
    @dishes << dish
    rebuild_menu
  end

  def remove dish
    fail NO_DISH_ERR unless @dishes.include? dish
    @dishes.delete(dish)
    rebuild_menu
  end

  private
  def rebuild_menu
    @menu.clear
    @dishes.each { |dish| @menu[dish.name.upcase] = dish.price }
  end

end
