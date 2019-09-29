
# has a list of dishes x
# add dishes x
#remove dishes
#display the dishes
#pay for them

class Order

  attr_reader :dishes

  def initialize
  @dishes = []
  end

  def add(dish)
    dishes << dish
  end

  def remove(dish)
    raise "Woah there, you haven't ordered this yet" unless dishes.include?(dish)

    dishes.delete(dish)
    self.dishes
  end

end
