class Order

attr_reader :number, :basket, :pending_total

  def initialize
    @number = 1
    @basket = []
    @pending_total = 0
  end

  def add_to_basket(dish)
    @basket << dish
    total_so_far
  end

  def view_basket
    @basket
  end

  def total_so_far
    @pending_total += @basket[-1][1]
  end

  def total_due
    total = 0
    @basket.each do | price |
      total += price[1]
    end
    total
  end

  def total_correct?
    total_due == @pending_total
  end
end
