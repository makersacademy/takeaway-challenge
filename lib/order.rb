class Order
  
  ERR_INVALID_ORDER = "The selected dish is not on the menu".freeze
  ERR_EMPTY_ORDER = "The order is empty".freeze
  
  attr_reader :dishes, :total
  
  def initialize(menu)
    @dishes = {}
    @total = 0
    @menu = menu
  end
  
  def add(dish, qty = 1)
    fail ERR_INVALID_ORDER unless menu.contains? dish
    dishes[dish] = qty
  end
  
  alias update add
  
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
    dishes.key? dish
  end
  
  def display
    fail ERR_EMPTY_ORDER if dishes.empty?
    dishes.map do |dish, qty|
      format("%s x %d", dish, qty)
    end.join("\n")
  end
  
  def reset
    dishes.map{ |dish, qty| remove dish }
  end
  
  private 
    attr_reader :menu
  
end