require_relative 'takeaway'

class Customer < Takeaway
  
  def show_menu
    menu.each do |item_name, item_price|
      p "#{item_name}: £#{item_price}"
  	end
  end
  
  def order_item(item_name, quantity)
  	quantity.times do
      order << menu.select do |choice|
        choice == item_name
  	  end
  	end
  end
  
  def view_order
    order
  end
  
  def order_price
    total_price = order.map { |cost| cost.values }.flatten(1).inject(:+)
    p "The cost for your order is £#{total_price.round(2)}"
  end
  
  def place_order
    fail "You haven't ordered any food" if order == []
    to_cook << order
    order = []
    order_in
  end  
end