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
    basket.basket.uniq.each do |dish|
      price = dish.values[0] * basket.basket.count(dish)
      puts "No. #{basket.basket.count(dish)} x #{dish.keys[0].capitalize}: £ #{price}"
    end
  end
end
