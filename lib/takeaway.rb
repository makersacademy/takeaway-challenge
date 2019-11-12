class Takeaway
  attr_reader :menu, :order

  def initialize
    @menu = {"Pizza" => 5, "Chips" => 2, "Curry" => 6.5}
    @order = {}
  end

  def add(item, quantity = 1)
    if @order.key?(item)
      @order[item] += quantity
    else
      @order[item] = quantity
    end
  end
end
