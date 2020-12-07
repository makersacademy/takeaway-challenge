class Menu

  attr_reader :dishes

  def initialize#(dishes)
    @dishes = {
      :Burger => 5.00,
      :Chips => 1.50,
      "Chicken" => 2.00,

    }
  end

  def show_menu
    dishes.map { |dish, price| "%s £%.2f" % [dish.to_s.capitalize, price] }.join(', ')
  end

  def has_dish?(dish)
    !!dishes[dish]
  end

  def price(dish)
    dishes[dish]
  end
  
end
