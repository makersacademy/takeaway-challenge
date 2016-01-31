
class Order

  attr_reader :new_order

  def initialize
    @new_order = {}
  end

  def current_order
    @new_order.dup
  end

  def add_item(item, quantity=1)
    fail 'No such item on the menu' unless @menu.list.include?(item)
    @new_order[item] = quantity
  end

  def order_total
    "Order Total: £#{order_calc}"
  end

  def order_summary
    summary
  end

  private

  def order_calc
    @new_order.new_order.map { |item, quantity| @menu.list[item] * quantity }.inject(:+)
  end

  def summary
    @new_order.map do |item, quantity|
      "#{quantity} x #{item} = £#{@menu.list[item] * quantity}"
    end.join(', ')
  end

end
