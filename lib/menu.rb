class Menu

  attr_reader :dishes, :dish, :printer

  def initialize
    @dishes = []
    @dish = dish
    @printer = Printer.new
  end

  def add_dish(dish)
    @dishes << { name: dish.name, price: printer.format_price(dish.price) }
  end

  def show_menu
    h = @dishes.map do |d|
      "#{d[:name].capitalize}: £#{printer.format_price(d[:price])}"
    end
    h.join("\n")
  end

  def on_menu?(dish)
    items = @dishes.map { |item| item[:name] }
    items.include?(dish.name)
  end
end
