class Takeaway
  attr_reader :dishes
  def dishes
    @dishes = [{dish: 'Fish and chips', price: 8},
    {dish: 'Paella', price: 10}]
  end

  def print_dishes
    dishes.each do
      |item| puts "#{item[:dish]}: £#{item[:price]}"
    end
  end
end
