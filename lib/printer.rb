#understands how to print a list of items to a terminal window
require "./lib/core_ext/Fixnum"
module Printer
  def self.to_string (menu_class)
    items = menu_class.items
    items.map!.with_index(1){|item, index| item_to_string(item, index)}
    items.join("\n")
  end
  def self.item_to_string item, index
    index       = (index.to_s + ".").ljust(3)
    name        = item.name.ljust(20)
    description = item.description.ljust(40)
    price       = item.price.to_pounds_and_pence
    "#{index} #{name} #{description} #{price}"
  end
end
