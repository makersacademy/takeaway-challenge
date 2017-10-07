class Menu
  attr_reader :menu_header, :menu_items

  def display_menu(menu_header, menu_items, menu_footer)
    system('clear')
    display_header menu_header
    display_items menu_items
    display_footer menu_footer
  end

private
  def display_header(menu_header)
    puts "#{menu_header}\n\n"
  end

  def display_items(menu_items)
    puts "#{menu_items}\n\n"
  end

  def display_footer(menu_footer)
    puts "#{menu_footer}\n"
  end
end
