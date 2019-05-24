class Menu

  attr_reader :items

  def initialize(dish_class = Dish)
    @items = [
      dish_class.new('Margherita', 10),
      dish_class.new('Farmhouse', 12),
      dish_class.new('Hawaiian', 12),
      dish_class.new('Pepperoni', 13),
      dish_class.new('Meat Feast', 15),
      dish_class.new('Sea Shore', 14)
    ]
  end

  def get_dish(dish_choice)
    item = []
    @items.each do |dish|
      item << dish if dish.name == dish_choice
    end
    item
  end

end
