class Menu
  attr_reader :list

  default_menu = { Potato: 1, Hummus: 2, Beans: 1, Cheeze: 2, Chips: 3 }
  def initialize(food = default_menu)
    @list = {}
    food.each do |dish, price|
      @list.store(dish, price)
    end
  end
end
