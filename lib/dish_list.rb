class DishList

  attr_reader :dish_list_prices

  def initialize
    @dish_list_prices = { spaghetti_bolognese: 30,
                          chicken_pesto: 44,
                          fettuccine_beef: 42,
                          chilli_chicken: 45,
                          sabor_salad: 32,
                          tiramisu: 15,
                          banoffee_pie: 15
                        }
  end

  def menu
    @dish_list_prices.each do |item, price|
      puts "#{item} - £#{price}"
    end
  end

  def price(item)
    @dish_list_prices[item]
  end

end
