class Order
  attr_reader :dishes

  def initialize
    @dishes = Array.new
  end

  def add(dish)
    dishes << dish
  end

  def total
    puts "Order total: £#{dishes.map { |dish| dish.price  }.reduce(:+)}"
  end

  def display
    dishes.each do |dish|
      puts "#{dish.name} £#{dish.price}"
    end
    total
  end
end
