require_relative 'basket'

class Takeaway

  def initialize(basket = Basket.new)
      @basket = basket
  end

  def read_menu
    @basket.menu
  end

  def add(item, quantity)
    @basket.add(item, quantity)
  end

  def basket_summary
    @basket.basket_summary
  end

  def total
    @basket.total
  end


end
