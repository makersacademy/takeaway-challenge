module LineItemListPrinter
  def line_items_string(conjoiner = "\n")
    @menu_items.map(&:to_string).join(conjoiner)
  end
end