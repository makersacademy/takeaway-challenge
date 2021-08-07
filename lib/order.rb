class Order

  attr_reader :order

  def initialize(inventory = Hash.new)
    @order = Array.new
    @inventory = inventory
  end
  
  def add(item)
    @order << item if available?(item) 
  end

private

  def available?(item)
    @inventory.key?(item)
  end

end
