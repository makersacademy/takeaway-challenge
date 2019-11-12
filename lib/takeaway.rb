class Takeaway
  attr_reader :menu, :order

  def initialize
    @menu = {"Pizza" => 5, "Chips" => 2, "Curry" => 6.5}
    @order = {}
  end

  def add(item)
    if @order.key?(item)
      @order[item] += 1
    else
      @order[item] = 1
    end
  end
end
