class Menu

  attr_reader :dishes, :dish

  def initialize
    @dishes = []
    @dish = dish
  end

  def add_dish(dish)
    @dishes << { name: dish.name, price: dish.price }
  end

  def show_menu
    @dishes.map! { |dish| "#{dish[:name].capitalize}: £#{dish[:price]}" }
    @dishes.join("\n")
  end

  def on_menu?(dish)
    items = @dishes.map! { |item| item[:name] }
    items.include?(dish.name)
  end
end
