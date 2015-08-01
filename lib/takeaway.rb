class TakeAway


  attr_reader :menu
  attr_accessor :order

  def initialize
    @order = {}
  end

  def add_menu(menu)
    @menu = menu.dishes
  end

  def show_menu
    menu
  end

  def place_order(items={})
    items.each do |dish, quantity|
      raise "This item is not on the menu." unless menu.include?(dish)
      order["#{dish} x #{quantity}"] = total_cost_per_item(menu[dish], quantity)
    end
  end

  def total_cost_per_item(price, quantity)
    (price * quantity).round(2)
  end

  def delete_from_order(dish, quantity)
    order.delete("#{dish} x #{quantity}")
  end

end

