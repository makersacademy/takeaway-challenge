class Order
  attr_reader :trolley, :total, :menu, :dish
  
  def initialize
    @total = 0
    @trolley = []
  end
  
  def view_menu(menu)
    @menu = menu
  end
  
  def add_dish(dish)
    @trolley << dish
    @trolley
  end
  
end
