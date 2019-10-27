require_relative 'order'
class Menu

  attr_reader :items, :print

  def initialize(items)
    @items = {
      'Pizza Margherita' => 7,
      'Pepperoni Pizza' => 8,
      'Chicken Supreme' => 9,
      'Vegetarian Supreme' => 8,
    }
  end

  def print
    @items.map do |dish, price|
      "#{dish}: £#{price.to_s}"
    end.join("\n")
  end
  
  def price(dish)
    @items[dish]
  end

end