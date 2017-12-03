class Printer
  def print_menu(menu)
    menu.each { |item| puts "##{item.tag}: #{item.name}, #{item.description}, £#{item.price}." }
  end
end
