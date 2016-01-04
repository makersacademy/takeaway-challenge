class Order
  attr_reader :menu, :dishes, :quantity, :total

  def initialize(menu_klass)
    @menu = menu_klass
    @dishes = []
    @quantity = 0
  end

  def choose(dish, quantity=1)
    fail "This is not on the menu" unless self.has_dish?(dish)
    quantity.times do
      menu.select { |k,v| dishes.push([k, v]) if k == dish }
    end
  end

  def calculate_quantities(order)
    b = Hash.new(0)
    dishes.each { |v| b[v] += 1 }
    b.each { |k, v| puts "#{v} x #{k[0]}" }
    quantity = dishes.length
  end

  def calculate_cost(order)
    @total = dishes.inject(0) do |memo, k|
      memo + k[1]
    end
    puts "The total cost of your order is £#{total}."
    @total
  end

  def has_dish?(dish)
    !menu[dish].nil?
  end

end
