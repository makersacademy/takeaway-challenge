class App
  attr_reader :list
  def initialize(list_class = DishList)
    @list = list_class.new
  end 

  def display_dishes
    list.display
  end
  
  def select_dish(item, quantity)
    list.select(item, quantity)
  end 
end