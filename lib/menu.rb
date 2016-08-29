class Menu
  attr_reader :items

  def initialize
    @items = {"Margherita" => 6,
      "Pepperoni" => 7,
      "Vegetariana" => 7,
      "Hawaiian" => 7,
      "Garlic Pizza Bread" => 4}
  end

  def show
    index = 1
    items.each {|item, price| puts "#{index}. #{item} - #{price}"
      index += 1}
  end

  def get_price(item)
    fail 'This item is not currently on our menu' if !items.include?(item)
    items[item]
  end

end
