class MenuItem

  attr_reader :name, :price, :category

  def initialize(name, price, category)
    @name = name
    @price = price
    @category = category
  end

  def to_s
    @name + ": " + "£#{@price}"
  end

end
