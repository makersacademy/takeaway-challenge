class Order

  def initialize 
    @basket = {}
    @menu = Dishes.new.dishes
  end

  def add_to_basket(dish, quantity = 1)
    unless @basket[dish] 
      @basket[dish] = 0
    end
    @basket[dish] += quantity
  end

  def order_basket
    @basket
  end

  def total
    total = 0.00
    @basket.each do |item, quantity|
      total += quantity * @menu[item]
    end
    total
  end

  def summary
    summary = ""
    @basket.each do |item, quantity|
      summary += "#{quantity}x #{item} £#{'%.2f' % (quantity * @menu[item])} "
    end
    summary
  end

end
