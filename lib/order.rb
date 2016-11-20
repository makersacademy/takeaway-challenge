require_relative './menu'

class Order

attr_reader :list_of_dishes, :current_order_price, :menu

  def initialize
    @list_of_dishes = { "margherita" => 9, "pepperoni" => 10 }
    @current_order_price = 0
    @menu = Menu.new
 end

  def order(item, quantity)
    fail "Cannot add item(s): quantity is less than one." if quantity < 1
    bill(item, quantity)
    "You have ordered #{quantity} #{item}(s)."
  end

  def expected_total(total)
    total == @current_order_price? "Thank you! Your order was placed and is being delivered by our best directionally challenged learner driver. It will be delivered before #{Time.now.strftime("%H").to_i+1}:#{Time.now.strftime("%M")}" : "Your total is wrong: please enter the correct total."
  end


private

  def bill(item, quantity)
    @current_order_price += list_of_dishes[item] * quantity
  end

end
