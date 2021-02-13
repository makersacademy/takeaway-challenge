class Order
  attr_reader :items_ordered, :items_price

  def initialize
    @items_ordered = []
    @items_price = []
  end

end

# @menu.at(index)[:item]

# pizza_pilgrim.menu.at(3)
#  => {:item=>"Nduja", :price=>11.5}
