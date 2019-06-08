require_relative 'item_printer'

module ItemsArrayPrinter
  def self.to_string(items, item_printer = ItemPrinter)
    items.map { |item| item_printer.to_string(item) }.join("\n")
  end
end
