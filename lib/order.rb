class Order

  attr_reader :closed, :order

  def initialize(menu)
    @order = []
    @menu = menu
    @closed = false
  end

  def finish_order
    @closed = true
  end

  def add_dish(name)
    @order.push({ name => @menu[name] }) if @menu.dish_in_menu?
  end

  def calc_sum
    sum = 0
    @order.each do |dish|
      sum += dish.values.sum
    end
    return sum
  end

end
