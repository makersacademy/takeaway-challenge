class Food
  @@id = 1
  attr_reader :id

  def initialize(item_name, item_price)
    @id = @@id
    @@id += 1
    @item_name = item_name
    @item_price = item_price
  end
end