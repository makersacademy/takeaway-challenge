class Order

  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
  end

  def add_to_basket(dish, qty)
    @basket[dish] += qty
  end

  def remove_from_basket(dish, qty)
    @basket[dish] -= qty
    if @basket[dish] <= 0; @basket.delete(dish); end
  end

  def basket_total
    @basket.map { |dish, qty| "#{qty} x £#{@menu.menu_list[dish]} - #{dish}, " }
           .join + "Total: £#{cost}"
  end

  def prepare_order
    @basket[:ready] = true
  end

  private

  def cost
    @basket.map { |dish, qty| @menu.menu_list[dish] * qty }.sum
  end
end
