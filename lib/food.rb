class Goods
  @@id = 1
  attr_reader :id, :item_name, :item_price

  def initialize(item_name, item_price)
    @id = @@id
    @@id += 1
    @item_name = item_name
    @item_price = item_price
  end
end

class Food < Goods
  attr_reader :course
  def initialize(item_name, item_price, course)
    super(item_name, item_price)
    @course = course
  end
end