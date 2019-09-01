# frozen_string_literal: true

module MenuItemListPrinter
  def menu_items_string(conjoiner = "\n")
    @menu_items.map(&:to_string).join(conjoiner)
  end
end