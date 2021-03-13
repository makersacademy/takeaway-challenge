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

  def total_due
    total = 0
    @basket.each do | price |
      total += price[1]
    end
    "£#{total}"
  end
end
