class Order
  attr_reader :food_items
  def initialize(food_hash)
    @food_items = food_hash
    @confirmed = false
  end
  
  def confirm
    @confirmed = true
  end
end