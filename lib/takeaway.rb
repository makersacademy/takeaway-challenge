class Takeaway
  attr_reader :dishes
  def dishes
    @dishes = [{dish: 'Fish and chips', price: 8},
    {dish: 'Paella', price: 10}]
  end

  def print_dishes
    dishes.each_with_index do |item, i|
      puts "#{i + 1}. #{item[:dish]}: £#{item[:price]}"
    end
  end

  def choose_order(order_number, quantity = 1)
    choice = []
    choice << dishes[order_number - 1]
  end



end
