class Menu

  def initialize(dish = Dish)
    @dish = dish
    @items = []
  end

  def get(index)
    all[index]
  end





  private
  def all
    @items
  end

end