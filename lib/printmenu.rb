class PrintMenu
  def print(menu)
    body = ""
    body << print_header
    body << print_body(menu)
  end
  def print_dish(menu,dish)
    dish_without_snakecase = dish.name.to_s.tr("_"," ")
    return "\n#{menu.lookup.dish_number(dish).to_s}. #{dish_without_snakecase} £#{"%.2f" % dish.price}"
  end
  def print_body(menu)
    body = ""
    menu.available_dishes.each do |dish|
      body << "#{print_dish(menu,dish)}"
    end
      body << "\n"
    return body
  end
  def print_header
    body = ""
    file_root = File.expand_path(File.dirname("menu_header_text.txt"))
    File.open(File.join(file_root,"lib/menu_header_text.txt")).each { |line| body << line }
    return body
  end
end
