class Item

  attr_reader :price, :name, :tag

  def initialize(price,name,tag)
    @price = price
    @name = name
    @tag = tag
  end

end
