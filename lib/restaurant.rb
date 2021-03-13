class Restaurant
  def initialize
    @dishes = Dishes.new
  end
  
  def list_dishes
    @dishes.list_menu
  end
end
