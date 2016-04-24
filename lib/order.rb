class Order
  MENU_ERR = 'Item not on menu'.freeze

  def initialize menu
    @menu = menu
    @order = {total: 0}
  end

  def add dish, quantity
    fail MENU_ERR unless on_menu? dish
    add_to_order(dish, quantity)
  end

  def summary
    @order.clone
  end

  private
  def add_to_order dish, quantity
    @order[dish.name] = 0 unless ordered?(dish)
    @order[dish.name] += quantity
    @order[:total] += (@menu.view[dish.name] * quantity)
  end

  def ordered? dish
    @order.key?(dish.name)
  end

  def on_menu? dish
    !!@menu.view[dish.name]
  end

end
