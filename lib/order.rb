class Order

attr_reader :basket

  def initialize
    @basket = []
  end

  def add(dish, price, amount)
    basket << { dish: dish, unit_price: price, amount: amount, selection_price: price*amount }
  end

  def total
    basket.map { |selection| selection[:selection_price]}.inject(:+)
  end

  def confirm
    basket.each { |selection| puts ("#{selection[:amount]}x #{selection[:dish]}  £#{selection[:unit_price]}").center(100)}
    puts ("----------------------------").center(100)
    puts ("Total: £#{total}").center(100)
  end
end
