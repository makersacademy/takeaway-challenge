class Menu
  attr_reader :menu_items

  MENU_HEADER = "#{"*" * 45}
*       Welcome to Kay's Desk takeway       *
*                                           *
* Come for the food, leave for the hospital *
#{"*" * 45}\n\n"

  MENU_ITEM_HEADER = "\nCode\tDescription\tPrice\n"
  MENU_ITEMS = "A\tSalmon onigiri\t1.5
B\tChicken onigiri\t1.5
D\tChicken katsu\t5
E\tBeef teriyaki\t6
F\tSashimi (4pcs)\t3
G\tNigiri (4pcs)\t4

M\tShow menu\t
O\tShow ordered items\t
T\tConfirm order & text details\t
X\tClear order\t

Q\tQuit\n\n"

  def show
    system('clear')
    print MENU_HEADER
    print MENU_ITEM_HEADER
    print MENU_ITEMS
  end
end
