class Order

  attr_reader :total

  ORDER_TIME = 30

  def initialize
    @items = []
    @total = 0
  end

  def add(item)
    @items.push(item)
    @total += item.price
  end

  def show
    @items.dup
  end

  def check_total
    total = 0
    @items.each { |dish| total += dish.price }
    @total == total
  end

end
