class Order
attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end


  def add(dish, quantity)
    fail "#{dish} is not on the menu!" unless menu.has_dish?(dish)
    @basket << {dish: dish, quantity: quantity}
  end


  def quantity_price
    basket.map do |basket|
      dish = basket[:dish]
      quantity = basket[:quantity]
      menu.price(dish) * quantity
    end
  end


  def total_price
    quantity_price.inject(:+)
  end

end
