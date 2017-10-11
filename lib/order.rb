class Order
  attr_reader :items

  def initialize(items = Hash.new(0))
    @items = items
  end

  def add_dish(dish)
    @items[dish] += 1
  end

  def total
    @items.map do |dish, quantity|
      dish.price.to_f * quantity.to_f
   end.inject(:+)
  end

  def total_to_string
    "Your total order is £#{'%.2f' % total}."
  end

end
