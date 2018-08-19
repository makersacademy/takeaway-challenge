class Takeaway
  attr_reader :dishes
  attr_accessor :choice, :order_total

  def initialize
    @dishes = [{dish: 'Fish and chips', price: 8},
    {dish: 'Paella', price: 10}]
    @choice = []
    @order_total = 0
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

  def total
    choice.each { |item| self.order_total += item[:price] }
    order_total
  end

end
