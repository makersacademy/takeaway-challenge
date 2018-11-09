require_relative 'menu'

class Takeaway
 def show_menu
   menu = Menu.new('Our menu')
   menu.print
 end
end
