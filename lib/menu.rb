class Menu

  attr_reader :dishes, :dish

  def initialize
    @dishes = []
    @dish = dish
  end

  def add_dish(dish)
    @dishes << { name: dish.name, price: "%.2f" % dish.price }
  end

  def show_menu
    h = @dishes.map { |dish| "#{dish[:name].capitalize}: £#{ "%.2f" % dish[:price]}" }
    h.join("\n")
  end

  def on_menu?(dish)
    items = @dishes.map { |item| item[:name] }
    items.include?(dish.name)
  end
end
