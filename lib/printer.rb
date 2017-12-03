class Printer
  def print_menu(menu)
    menu.each { |item| puts "##{item.item_id}: #{item.name}, #{item.description}, £#{item.price}." }
  end
end
