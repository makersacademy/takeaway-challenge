class Menu
  attr_reader :menu_header, :menu_items

  MENU_HEADER = "#{"*" * 35}
*  Welcome to Kay's Desk takeway  *
#{"*" * 35}\n\n"

  MENU_ITEMS = "\n#\tDescription\tPrice
A\tSalmon onigiri\t1.5
B\tChicken onigiri\t1.5
C\tChicken teriyaki\t5
D\tChicken katsu\t5
E\tBeef teriyaki\t6
F\tSalmon sashimi (4pcs)\t3
G\tSalmon nigiri (4pcs)\t4\n"

  def display_header
    system('clear')
    puts MENU_HEADER
  end

  def display_items
    puts MENU_ITEMS
  end

end
