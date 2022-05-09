class Takeaway

  attr_reader :order, :dishes

  def initialize
    @order = {}
    @dishes = {:chicken => 5, :pizza => 3, :ice_cream => 2}
  end

  def menu
    @dishes
  end

  def select_dishes(dish, quantity = 1)

  end
end
