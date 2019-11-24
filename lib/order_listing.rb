class OrderListing
  attr_reader :dish, :quantity

  SINGLE_SERVING = 1
  
  def initialize(dish, quantity = SINGLE_SERVING)
    @dish = dish
    @quantity = quantity
  end

  def add_serving
    @quantity += 1
  end

  def remove_serving
    @quantity -= 1
  end

  def entry
    "#{formatted(dish.name)} – Quantity: #{quantity}"
  end

  private

  def formatted(symbol)
    symbol.to_s.split('_').map { |word| word.capitalize }.join(' ')
  end
end
