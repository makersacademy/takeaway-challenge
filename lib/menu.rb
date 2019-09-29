class Menu
  attr_reader :items

  def initialize
    @items = { :margherita => 7.50, :pepperoni => 10.50,
              :calzone => 12.50, :diavola => 10.50 }
  end

  def price(item)
    @items[item.to_sym]
  end
end
