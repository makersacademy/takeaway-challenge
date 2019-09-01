require_relative 'takeaway'

class Order

 attr_reader :basket

def initialize
  @basket = {}
end

  def add_items(item,quantity)
  @basket[item] = quantity
  end

end
