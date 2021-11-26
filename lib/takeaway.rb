class Takeaway

  attr_reader :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
  end

  def show_menu
    @menu.show
  end

  def add_to_order(item)
    @menu.dishes.each { |food| order.push(food) if food.name == item }
  end

end
