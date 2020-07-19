class Order
  attr_reader :dishes
  def initialize(menu)
    @dishes = {}
    @menu = menu
  end
  
  def add(item, quantity)
    @dishes[item] = quantity
  end
  
  def total
    sum_total[0]
  end
  
  private
  
  attr_reader :menu
  
  def sum_total
    dishes.map do |item, quantity|
      menu.price(item) * quantity
    end
  end
  
end
