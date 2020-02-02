class Menu

  attr_reader :basket

  def initialize(menu = [], basket = Basket.new)
    @menu = menu
    @basket = basket
  end

  def dish_add(dish)
    @menu << dish
  end

  def menu
    @menu.each { |dish| puts "#{dish.name} - £#{dish.price}" }
  end

  def add(*item)
    item.each { |dish| @basket.add(dish) }
  end

  def view
    @basket.view
  end

end
