class Order
  attr_reader :dishes
  
  def initialize
    @dishes = []
  end

  def select_dish(dish, quantity)
    @dishes << { dish: dish, quantity: quantity }
  end

  def total
    return 0 if dishes.empty?
    dishes.map { |item| line_item_total(item) }.reduce(:+)
  end

  private

  def line_item_total(line_item)
    line_item[:dish].price * line_item[:quantity]
  end
end
