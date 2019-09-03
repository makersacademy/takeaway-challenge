# frozen_string_literal: true

require './lib/menu_item_list_printer'

class Menu
  include MenuItemListPrinter

  def initialize(menu_items)
    @menu_items = menu_items
  end

  def menu_items
    @menu_items.dup
  end

  def items_at(item_indices)
    item_indices.reduce([]) { |items, i| items << @menu_items[i] }
  end
end
