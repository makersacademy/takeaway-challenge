require_relative 'menu'

class TakeAway
   def initialize(menu: Menu.new)
     @todays_dishes = menu.view_list
   end

end
