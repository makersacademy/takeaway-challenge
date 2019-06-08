require_relative './item_printer.rb'

module OrderPrinter

  def self.print(items, item_printer = ItemPrinter)
    items.map { |dish, quantity| item_printer.print(dish, quantity) }.join "\n"
  end

end
