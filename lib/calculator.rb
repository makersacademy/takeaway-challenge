class Calculator
  # Would like to shorten method but not sure how
  def self.current_basket(order, dishes)
    result = []
    order.each do |item, quantity|
      dishes.each do |name, price|
        result.push({item_name: item.to_s , quantity: quantity, subtotal: price * quantity}) if item == name
      end
    end
    result
  end
end