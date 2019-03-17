class Choice
  attr_reader :price, :name
  def initialize(name = "", price = 0)
    @name = name
    @price = price
  end

  def str
    "#{@name} : #{@price}"
  end
end
