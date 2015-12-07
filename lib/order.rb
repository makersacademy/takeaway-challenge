class Order
  attr_reader :menu, :dishes, :quantity, :total

  def initialize(menu_klass)
    @menu = menu_klass
    @dishes = []
  end

  def choose(dish, quantity=1)
    quantity.times do
      menu.select { |item,price| dishes.push([item, price]) if item == dish }
    end
  end

  def calculate_quantities(order)
    quantities = Hash.new(0)
    dishes.each { |num| quantities[num] += 1 }
    quantities.each { |item, num| puts "Your order contains #{num} x #{item[0]}" }
    @quantity = dishes.length
  end

  def calculate_cost(order)
    @total = dishes.inject(0) do |memo, k|
      memo + k[1]
    end
  end

end
