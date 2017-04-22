#Responsible for adding, removing, editing and showing a list of all dishes.

class Dishes

attr_reader :list

def initialize
  @list = {"Pizza" => 5,
           "Pasta" => 3,
           "Macaroni and Cheese" => 2}
end



  def add_dish(name, price)
    self.list[name] = price
  end

  def remove_dish
  end

  def all_dishes
    @list
  end

  def edit_dish
  end
end
