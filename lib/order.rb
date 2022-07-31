require_relative 'menu'

class Order

  attr_reader :my_order, :menu
  
  def initialize(menu = Menu.new)
    @menu = menu
    @my_order = []
  end

  def add(dish_name)
   
    @menu.menu_list.each do |dish| 
      if dish[:dish] == dish_name
        @my_order << dish
        return "You've added #{dish[:dish]} to your order!" 
      end  
    end
    
  end
end