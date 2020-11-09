class Goods
  @@id = 1
  attr_reader :id, :item_name, :item_price

  def initialize(item_name, item_price)
    @id = @@id
    @@id += 1
    @item_name = item_name
    @item_price = item_price
  end

  def to_s
    "Item ##{@id}" + ": " + @item_name + " - £#{@item_price.round(2)}"
  end
end

class Food < Goods
  attr_reader :course
  def initialize(item_name, item_price, course)
    super(item_name, item_price)
    @course = course
  end

  def to_s
    super.to_s + " (#{@course.to_s.capitalize})"
  end
end

class Drink < Goods
  attr_reader :alcoholic
  def initialize(item_name, item_price, alcoholic)
    super(item_name, item_price)
    @alcoholic = alcoholic
  end

  def to_s
    super.to_s + " (Drink)"
  end
end
