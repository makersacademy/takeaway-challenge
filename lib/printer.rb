class Printer

  def print_menu(menu)
    format_menu(menu)
    menu.each { |item| puts "##{item.item_id}: #{item.name}, #{item.description}, £#{item.price}." }
  end

  private
  def format_menu(menu)
    menu.sort_by(&:item_id)
  end

end
