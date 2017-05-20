class Menu

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def show_menu
    @dishes.map.with_index do |dish, number|
      "#{number + 1}. #{dish.name}, £#{'%.2f' % dish.price}"
    end.join(", ")
  end

  def select_dish(name)
    selected = @dishes.find { |dish| dish.name == name }
    return { name: selected.name, price: selected.price } if !!selected
    "#{name} is not on the menu"
  end
end
