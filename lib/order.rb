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
    raise 'Order is already finished' if @closed
    @order << { name => @menu.menu[name] } if @menu.dish_in_menu?(name)
  end

  def calc_sum
    sum = 0
    @order.each do |dish|
      sum += dish.values.sum
    end
    return sum
  end

end
