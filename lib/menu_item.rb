class Menu_item

  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price

  end

end

# curry = Menu_item.new("Curry",5)
# p curry
