class Order

  attr_reader :basket

  def initialize 
    @basket = Hash.new(0)
  end

  def add_item(item, quantity = 1)
    @basket[item] = @basket[item] + quantity
    "You have added #{quantity} #{item}#{quantity > 1 ? "s" : nil} into your basket"
  end
end 
