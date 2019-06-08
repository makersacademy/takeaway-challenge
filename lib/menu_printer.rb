require_relative './dish_printer.rb'

module MenuPrinter

  def self.print(items, dish_printer = DishPrinter)
    items.map { |name, dish| dish_printer.print(dish) }.flatten.join"\n"
  end

end