require_relative '../lib/item_printer'

module ItemListPrinter
  def self.to_string(items, item_printer = ItemPrinter)
    items.each_with_index.map { |item, index|
      item_printer.to_string(item, index + 1)
    }.join("\n")
  end
end
