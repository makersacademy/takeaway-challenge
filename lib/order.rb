class Order

attr_reader :number, :basket

  def initialize
    @number = 1
    @basket = []
  end

  def add_to_basket(dish)
    @basket << dish
  end

  def view_basket
    @basket
  end
end
