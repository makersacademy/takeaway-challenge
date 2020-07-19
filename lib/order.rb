class Order
  attr_reader :summary
  def initialize
    @summary = []
  end
  def add(dish)
    @summary << dish
  end
  def total
    subtotal = 0.0
    @summary.each { |item|
      subtotal += item.price.to_f
      puts "#{item.name}, #{item.price}"
    }
    subtotal
  end
end
