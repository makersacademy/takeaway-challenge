require './lib/dishes'

class Orders
  include Dishes

  def view_menu
    # call list method from Dishes module
    list
  end

end
