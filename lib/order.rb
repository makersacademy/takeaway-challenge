class Order

attr_reader :list_of_dishes, :current_order

  def initialize
    @list_of_dishes = { "margherita" => 9, "pepperoni" => 10 }
    @current_order = 0
  end

  def order(order, quantity, total)
    fail "Cannot add item(s): quantity is less than one." if quantity < 1
    fail "Cannot add item(s): total is incorrect." if total != list_of_dishes[order].times {quantity}
    bill(order, quantity)
    "You have ordered #{quantity} #{order}(s)."
  end


private

  def bill(order, quantity)
    @current_order += list_of_dishes[order].times {quantity}
  end

end
