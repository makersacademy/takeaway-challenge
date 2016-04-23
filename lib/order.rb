class Order
  ERR_INVALID_ORDER = 'The selected dish is not on the menu'
  
  attr_reader :dishes, :total
  
  def initialize(menu)
    @dishes = {}
    @total = 0
    @menu = menu
  end
  
  def add(dish, qty = 1)
    raise ERR_INVALID_ORDER unless menu.contains? dish
    dishes[dish] = qty
  end
  
  alias :update :add
  
  def remove(dish)
    dishes.delete dish if contains?(dish)
  end
  
  def total
    result = 0
    dishes.each do |dish, qty|
      result += menu.dishes[dish] * qty
    end
    result
  end
  
  def contains?(dish)
    dishes.has_key? dish
  end
  
  private 
  
  attr_reader :menu
  
end