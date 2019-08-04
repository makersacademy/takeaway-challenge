require './lib/menu'
 menu = Menu.new
#<Menu:0x00007fe99da802a8 @menu={"Pasta"=>5, "Pizza"=>7, "Fish and Chips"=>10, "Soup"=>3}, @orders=[]> 
menu.select_order("Pasta")
#[{"Pasta"=>5}] 
menu.select_order("Pizza")
#[{"Pasta"=>5}, {"Pizza"=>7}] 
