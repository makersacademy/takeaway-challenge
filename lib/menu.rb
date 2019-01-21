 class Menu
def intialize(menu)
  @menu = menu
end
   def menu_list
      {
     rice: "£1",
     fish: "£4",
     eggs: "£2",
     orange: "£4" }

   end

   def print_menu
    p menu_list 
   end
end
