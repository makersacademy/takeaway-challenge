class Order

  def initialize
    @choices = []
  end

  def add(dish, quantity = 1)
    @choices << {dish => quantity}
  end

  def get(index)
    all[index]
  end

  private

  def all
    @choices
  end



end