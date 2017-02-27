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
    @items.slice!(@items.index(dish))
  end

  def clear_meal
    @items = []
  end

  def total_cost
    total = 0
    @items.each { |dish| total += dish.price.to_f }
    "£" + '%.2f' % total
  end

end
