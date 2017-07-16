class Menu

  attr_reader :dish, :price, :dishes

  def initialize(dish, price)
    @dish = dish
    @price = price
    @dishes = []
  end

  def read_menu_list
    "#{@dish}: £#{@price}"
  end

  def menu_list
    @dishes << read_menu_list
  end

end
