class Menu

  attr_reader :contents

  def initialize
    @contents = {}
  end

  def add_dish(dish)
    @contents[dish.name] = dish.price
  end
  
end
