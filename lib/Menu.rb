class Menu

attr_reader :price_list

  def initialize
    @price_list =   {
        lasagne: 8.99,
        pizza: 10.99,
        burger: 9.99
      }
  end

  def print_menu
    price_list.map do |dish, price|
    "%s £%.2f" % [dish.to_s.capitalize, price]
    end.join(', ')
  end

  def price(dish)
    price_list[dish]
  end

  def has_dish?(dish)
    !!price_list[dish]
  end

end
