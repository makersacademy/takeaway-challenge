class Order

  def initialize
    @list = {}
  end

  def add(dish, quantity)
    @list.store(dish.to_sym, quantity)
  end

  def list
    @list.dup
  end

  def store_cost(sum)
    @list.store(:total_price, sum)
  end

  def calculate_total(menu)
    sum = 0
    @list.each { |item, price| sum += menu[item] * price }
    sum
  end

end
