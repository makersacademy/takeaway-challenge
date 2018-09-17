class Order
  attr_reader :list

  def initialize
    @list = []
  end

  def add(*dishes)
    dishes.each { |dish|
      @list << dish
    }
  end

  def total
    @list.map { |item|
      item.price.to_f
    }.reduce(:+).round(2)
  end

  def clear
    @list = []
  end

end
