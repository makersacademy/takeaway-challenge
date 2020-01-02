class Printer
  def print(dishes)
    dishes.list.each do |category, items|
      puts category.upcase
      items.each do |item, price|
        puts "#{item.capitalize}: £ #{price}"
      end
      puts "\n"
    end
  end

  def view_basket(basket)
    basket.basket.each do |dish|
      dish.each do |item, price|
        puts "#{item.capitalize}: £ #{price}"
      end
    end
  end

  # def count
  #   basket.basket.each do |dish|
  #     basket.basket.count(dish)
  #   end
  # end
end
