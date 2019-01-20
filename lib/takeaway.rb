require_relative "menu"
attr_reader = :menu

 class Takeaway
   def initiallize(menu = Menu.new)
     @menu = menu
   end 

   def check_menu
    @menu.menu_list
   end

  
end
