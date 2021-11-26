class Order

  attr_accessor :basket

  def initialize
    @basket = []
  end

  def order(item)
    raise "Item is not on the menu" unless @menu.key?(item)
    @basket << { item => @menu[item] }
  end

end