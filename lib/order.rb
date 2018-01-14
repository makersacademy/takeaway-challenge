class Order

  def initialize(menu, basket = {})
    @basket = basket
    @menu = menu
  end

  def add(item, qty)
    if @basket.has_key? item
      @basket[item] += qty
    else
      @basket.store(item, qty)
    end
  end

  def to_s
    @basket.map {|item, qty| "#{qty} x #{item}  = £#{"%.2f" % (@menu.price(item) * qty)}"}.join("\n")
  end

  def total
    @basket.map{ |item, qty| @menu.price(item) * qty }.sum
  end

  def basket
    @basket.dup
  end

end