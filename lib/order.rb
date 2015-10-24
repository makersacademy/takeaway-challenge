class Order

  attr_reader :basket

  def initialize
    @basket = Hash.new(0)
  end

  def add_to_basket(itm, qty)
    basket[itm] += qty
  end

  def basket_sum(menu)
    basket.each do |itm, qty|
    return "#{itm} x#{qty} = £#{(menu.dishes[itm]*qty).round(2)}"
    end.join(", ")
  end

  def total_bill(menu)
    total = []
    basket.each{ |itm, qty| total << (menu.dishes[itm]*qty).round(2) }
    (total.inject(:+)).round(2)
  end

end
