class Menu

  def initialize(list_of_dishes)
    @list_of_dishes = list_of_dishes
    @order = []
  end

  def list_dishes
    menu = ''
    @list_of_dishes.each do |dish|
      menu += "#{dish[:dish_name]}, £#{dish[:dish_price]}\n"
    end
    return menu
  end

  def select_dish(dish, quantity)
    quantity.times {@order << { @list_of_dishes[dish] }}
  end

  def get_order
    @order
  end

end
