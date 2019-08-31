module LineItemListPrinter
  def print_line_items(conjoiner = "\n")
    (@menu_items || menu_items).map { |item| item.to_string }.join(conjoiner)
  end
end