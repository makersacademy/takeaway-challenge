class Printer
  def print(dishes)
    dishes.list.each do |category, items|
      puts category.upcase
      items.each do |item, price|
        puts "#{item}: £ #{price}"
      end
      puts "\n"
    end
  end

  def view_basket(basket)
    puts basket.basket
  end
end
