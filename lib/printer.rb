class Printer

  def print_menu(menu)
    new_menu = format_menu(menu)
    new_menu.each { |item| puts "##{item.item_id}: #{item.name}, #{item.description}, £#{item.price}." }
  end

  private
  def format_menu(menu)
    menu.sort_by { |item| item.item_id }
  end

end
