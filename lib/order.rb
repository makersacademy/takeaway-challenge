class Order

attr_reader :list_of_dishes, :current_order_price, :time

  def initialize
    @list_of_dishes = { "margherita" => 9, "pepperoni" => 10 }
    @current_order_price = 0
 end

  def order(order, quantity, total)
    fail "Cannot add item(s): quantity is less than one." if quantity < 1
    fail "Cannot add item(s): total is incorrect." if total != list_of_dishes[order] * quantity
    bill(order, quantity)
    "You have ordered #{quantity} #{order}(s)."
  end

  def expected_total(total)
    total == @current_order_price? "Thank you! Your order was placed and is being delivered by our best directionally challenged learner driver. It will be delivered before #{Time.now.strftime("%H").to_i+1}:#{Time.now.strftime("%M")}" : "Your total is wrong, perhaps you need to do some remedial Maths classes."
  end


# private

  def bill(order, quantity)
    @current_order_price += list_of_dishes[order] * quantity
  end

end
