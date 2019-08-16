menu = Menu.new # creates an instance of Menu
menu.display # displays menu in a nice format

takeaway = Takeaway.new # creates an instance of Takeaway

takeaway.view_menu # displays the menu

takeaway.add('prawn cracker', 1) # "1x prawn cracker(s) added to your basket"
takeaway.add('spring roll', 2) # "2x spring roll(s) added to your basket"
takeaway.add('burger', 1)
# "burger is not available, please choose dishes from menu"
