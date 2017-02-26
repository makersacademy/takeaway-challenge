class Meal

  attr_reader :items

  def initialize
    @items = []
  end

  def add_dish(dish)
    @items << dish
  end

  def remove_dish(dish)
    raise "That dish isn't part of your meal." unless @items.include? dish
    @items.delete dish
  end

  def total_cost
    total = 0
    @items.each { |dish| total += dish.price }
    total
  end

end
