require_relative '../lib/dish_printer'

module ObjectListPrinter
  def self.to_string(objects, dish_printer = DishPrinter)
    objects.each_with_index.map { |dish, index|
      dish_printer.to_string(dish, index + 1)
    }.join("\n")
  end
end
