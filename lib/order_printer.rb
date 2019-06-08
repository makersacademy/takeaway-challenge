require_relative './item_printer.rb'

module OrderPrinter

  def self.print(items, item_printer = ItemPrinter)
    items.map { |item| item_printer.print(item)}.join"\n"
  end

end