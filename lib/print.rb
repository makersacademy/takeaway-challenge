class Print

  def print_menu(menu)
    menu.each_with_index.map { |dish, index|
      format_dish(dish, index + 1)
    }.join("\n")
  end

  private

  def format_dish(dish, index)
    name = dish.name
    price = dish.price
    "#{index}. #{name} £#{price}"
  end

end
