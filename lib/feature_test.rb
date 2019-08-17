require './lib/menu'
require './lib/takeaway'

menu = Menu.new # creates an instance of Menu
menu.display # displays menu in a nice format

takeaway = Takeaway.new # creates an instance of Takeaway

takeaway.view_menu # displays the menu

takeaway.add('prawn cracker', 4) # "4x prawn cracker(s) added to your basket"
takeaway.add('spring roll', 2) # "2x spring roll(s) added to your basket"
takeaway.add('burger', 1)
# "burger is not available, please order from the menu"

takeaway.view_basket
# "prawn cracker x4 = £8, spring roll x2 = £6"

takeaway.total # "Total = £14"

takeaway.checkout
# "Thank you! Your order was placed and will be delivered before 18:52"
