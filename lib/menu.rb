class Menu

  attr_reader :name, :price, :dish, :menu

  def initialize(name, price)
    @name = name
    @price = price
    @dish = { name: name, price: price }
    @menu = []
  end

  def check_menu(dish)
    menu << dish
  end


end
