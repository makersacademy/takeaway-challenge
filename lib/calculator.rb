class Calculator

  attr_reader :result, :total

  # Would like to shorten method but not sure how
  def self.current_basket(order, dishes)
    result = []
    order.each do |item, quantity|
      dishes.each do |name, price|
        result.push({item_name: item.to_s , quantity: quantity, subtotal: price * quantity}) if item == name
      end
    end
    @result = result
  end

  def self.total
    total = 0
    @result.each do |line|
      total +=line.values[2]
    end
    @total = total
  end

end