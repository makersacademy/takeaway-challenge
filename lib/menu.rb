class Menu
  attr_reader :menu_items

  MENU_HEADER = "#{"*" * 35}
*  Welcome to Kay's Desk takeway  *
#{"*" * 35}\n\n"

  MENU_ITEM_HEADER = "\n#\tDescription\tPrice\n"
  MENU_ITEMS = "A\tSalmon onigiri\t1.5
B\tChicken onigiri\t1.5
D\tChicken katsu\t5
E\tBeef teriyaki\t6
F\tSashimi (4pcs)\t3
G\tNigiri (4pcs)\t4

S\tShow menu
T\tConfirm & text order
X\tDelete order"

  def show
    system('clear')
    print MENU_HEADER
    print MENU_ITEM_HEADER
    print MENU_ITEMS
  end
end
