class Item
  @@curr_id = 0
  attr_reader :id, :dish, :price
  def initialize(dish=nil,price=nil)
    #throws error if dish or price are nil, (meaning they weren't passed in)
    (dish == nil || price == nil) && (fail "you must pass a dish and price")

    @id = @@curr_id += 1
    @dish = dish
    @price = price
  end
end
    
