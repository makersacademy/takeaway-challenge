class Menu

  attr_reader :list_of_dishes

  def initialize
    @list_of_dishes = {}
  end

  def add(dish_name, price)
    @list_of_dishes[dish_name] = price
  end

  def price(dish_name)
    @list_of_dishes[dish_name]
  end
end
