class Restaurant
  attr_reader :dishes

  def initialize
    @dishes = [{dish: 'Fish and chips', price: 8},
    {dish: 'Paella', price: 10}]
  end

  def print_dishes
    dishes.each_with_index do |item, i|
      puts "#{i + 1}. #{item[:dish]}: £#{item[:price]}"
    end
  end

end
