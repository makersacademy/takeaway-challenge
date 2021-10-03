class TakeawayApp
  attr_reader :basket

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def view_dishes
    @menu.print
  end

  def add_dish(dish_name, quantity)
    @menu.release(dish_name, quantity).each { |dish| @basket << dish }
  end

  def view_basket
  end

end