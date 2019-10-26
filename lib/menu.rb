class Menu

  def dish_list
    @list ||= []
  end

  def add_dish(dishes)
    dish_list << {name: dishes.name, price: dishes.price}
  end

  def display_menu
    dish_list.map.with_index do |dish, index|
        "#{index + 1}. #{dish[:name]}: £#{dish[:price]}. "
    end.join
  end

end
