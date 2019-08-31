module LineItemListPrinter
  def print_line_items(conjoiner = "\n")
    (@line_items || line_items).map { |item| item.to_string }.join(conjoiner)
  end
end