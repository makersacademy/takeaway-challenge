class Order

  attr_reader :order, 
              :inventory

  def initialize(inventory)
    @order = Array.new
    @inventory = inventory
  end
  
  def add(item)
    # could raise error, or break with message, here if not available? would need test
    @order << {item => (inventory[item])} if available?(item) 
  end

private

  def available?(item)
    @inventory.key?(item)
  end

end
