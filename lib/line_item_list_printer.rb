module LineItemListPrinter
  def line_items_string(conjoiner = "\n")
    @menu_items.map { |item| item.to_string }.join(conjoiner)
  end
end