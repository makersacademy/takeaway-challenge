class Category 
  attr_reader :name, :items
  def initialize(name)
    @name = name
    @items = []
  end
  
  def add_dish(dish)
    @items << dish
  end

end
