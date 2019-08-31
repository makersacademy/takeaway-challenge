require './lib/line_item_list_printer'

class Menu
  include LineItemListPrinter

  def initialize(line_items)
    @line_items = line_items
  end

  def items
    @line_items.dup
  end
end
