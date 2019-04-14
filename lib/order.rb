class Order
  def initialize
    @items = {}
  end

  def add_dish(dish, qty)
    @items[dish.to_sym] = qty
  end

  def print_order(menu)
    total = 0
    dishes = ""
    @items.each do |dish, qty|
      dishes += "#{dish} x#{qty} ... £#{menu.dishes[dish] * qty}\n"
      total += menu.dishes[dish] * qty
    end
    dishes + "TOTAL ...... £#{total}"
  end
end
