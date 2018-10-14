class Price

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def item_price(item)
    return @menu.items.detect { |hash| hash[:dish] == item }[:price]
  end

  def total(order)
    cost = 0
    order.each do |dish, quantity|
      cost += quantity * item_price(dish.to_s)
    end
    return "£#{sprintf( '%.2f', cost)}"
  end

end
