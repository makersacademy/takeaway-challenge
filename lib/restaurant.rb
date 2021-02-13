class Restaurant
  def view_menu
    menu.meals
  end

  def add(meal)
    order << menu.meals.slice(meal)
  end

  def view_order
    order.dup
  end

  def place_order
    puts view_order
    confirm_order
  end

  private

  attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
  end

  def confirm_order
    puts 'Confirm order? Hit ⏎ to confirm'
    gets
  end
end
