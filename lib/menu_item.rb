class MenuItem
  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "#{@name} - £#{@price}.00"
  end
end
