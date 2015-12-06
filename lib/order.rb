class Order
  attr_reader :menu, :dishes, :quantity, :total

  def initialize(menu_klass)
    @menu = menu_klass
    @dishes = []
  end

  def choose(dish, quantity=1)
    quantity.times do
      menu.select { |k,v| dishes.push([k, v]) if k == dish }
    end
  end

  def calculate_quantities(order)
    b = Hash.new(0)
    dishes.each { |v| b[v] += 1 }
    b.each { |k, v| puts "#{v} x #{k[0]}" }
    @quantity = dishes.length
  end

  def calculate_cost(order)
    @total = dishes.inject(0) do |memo, k|
      memo + k[1]
    end
  end

end
