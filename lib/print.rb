class Print

  def print_menu(menu)
    menu.each_with_index.map { |dish, menu_number|
      format_dish(dish, menu_number + 1)
    }.join("\n")
  end

  private

  def format_dish(dish, index)
    "#{index}. #{dish.name} £#{dish.price}"
  end

end
