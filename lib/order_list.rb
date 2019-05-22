class OrderList
  attr_reader :order_items
  def initialize
    @order_items = []
  end

  def add(name, quantity)
    @order_items << { item: name, quantity: quantity }
    "Item added"
  end

  def check_last
    last_item = @order_items[-1]
    "#{last_item[:item]} - #{last_item[:quantity]}"
  end

# Could calculate_cost be simplified, any other methods extracted?
  def calculate_cost(menu)
    order_cost = 0
    @order_items.each do |item|
      menu.menu_items.each do |dish|
        if dish.description.include?(item[:item])
          order_cost += (dish.price * item[:quantity])
        end
      end
    end
    order_cost
  end
end
