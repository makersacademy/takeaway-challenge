class MenuItem
  attr_reader :name, :price
  
  def initialize(name, price)
    @name = name 
    @price = price
  end

  def format_item
    "#{name}: £#{'%.2f' % price}"
  end

end
