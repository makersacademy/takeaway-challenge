
class Customer

  def initialize(menu)
    @menu = menu
  end

  def show_menu
    menu.print_menu
  end

  def add(dish, number)

  end

  def remove(dish,number)

  end

  def place_order()

  end

  private

  attr_reader :menu

end