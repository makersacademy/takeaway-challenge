class Takeaway
  attr_reader :dishes
  attr_accessor :choice

  def initialize
    @dishes = [{dish: 'Fish and chips', price: 8},
    {dish: 'Paella', price: 10}]
    @choice = []
  end

  def print_dishes
    dishes.each_with_index do |item, i|
      puts "#{i + 1}. #{item[:dish]}: £#{item[:price]}"
    end
  end

  def choose_order(order_number, quantity = 1)
    quantity.times { choice << dishes[order_number - 1] }
    choice
  end

end
