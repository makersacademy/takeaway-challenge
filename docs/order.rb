class Order

  attr_reader :view, :total

  def initialize
    @view = []
    @total = 0
  end

  def add(dish)
    @view << dish
    @total += dish.price
  end
end
