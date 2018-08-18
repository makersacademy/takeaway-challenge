require './lib/dishes'

class Orders
  include Dishes

  def view_menu
    list 
  end

end
