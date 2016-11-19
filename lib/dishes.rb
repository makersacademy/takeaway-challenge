#Responsible for adding, removing, editing and showing a list of all dishes.

class Dishes

def initialize
  @list = []
end



  def add_dish(name, price, availability)
    @name = name
    @price = price
    @availability = availability
    dish_info = {:name => @name, :price => @price, :availability => @availability}
    @list << dish_info
  end

  def remove_dish
  end

  def all_dishes
    @list
  end

  def edit_dish
  end
end
