class TakeawayApp
  attr_accessor :basket

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
    basket_components = @basket.map { |dish| "#{dish.name}: £#{dish.price}" } << "Total: £#{total}"
    basket_components.join(" \n")
  end

  private

  def total
    total = 0.00
    @basket.each { |dish| total += dish.price }
    total
  end
end