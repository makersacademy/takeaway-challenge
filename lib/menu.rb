class Menu

  def initialize(dish = Dish)
    @dish = dish
    @items = []
  end

  def get(index)
    all[index]
  end

  def add(dish)
    @items << dish
  end

  def print
    all.map { |dish| "#{dish.name} #{dish.price}"}.join"\n"
  end






  private
  def all
    @items
  end

end