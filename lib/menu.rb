class Menu
  attr_reader :list
  
  def initialize(food = { Potato: 1, Hummus: 2, Beans: 1, Cheeze: 2, Chips: 3 })
    @list = {}
    food.each do |dish, price|
      @list.store(dish, price)
    end
  end
end
