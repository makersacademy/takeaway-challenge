class Menu
attr_reader :dishes

  def initialize
    @dishes = {
      hawaiian: 9.99,
      margherita: 7.99,
      vegetarian: 8.99
    }
  end


  def print_menu
    dishes.map do |dish, price|
      "%s £%.2f" % [dish.to_s.capitalize, price]
    end.join(', ')
  end

  def has_dish?(dish)
      !!dishes[dish]
  end

  def price(dish)
    dishes[dish]
  end


end
