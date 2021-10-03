class MenuItem
  attr_reader :price, :name

  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "#{@name} - £#{@price}.00"
  end
end
