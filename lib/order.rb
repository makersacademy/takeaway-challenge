class Order
  attr_reader :cart

  def initialize
    @cart = Hash.new(0)
  end

  def add_cart(item, qty)
    @cart[item] += qty
  end

  def cart_total(menu)
    @cart.map { |item, qty| "#{item} x#{qty} = $#{sprintf('%.2f' , menu.dishes[item] * qty)}" }.join(", ")
  end
end
