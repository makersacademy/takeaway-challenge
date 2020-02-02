class Calculator
  def self.current_basket(order, dishes)
    result = []
    order.each do |item, quantity|
      dishes.each do |name, price|
        if item == name
          result.push({item_name: item.to_s , quantity: quantity, subtotal: price * quantity})
        end
      end
    end
    result
  end
end


# {item_name: order.keys[0].to_s , quantity: order.values[0], subtotal: dishes.values[0] * order.values[0]}