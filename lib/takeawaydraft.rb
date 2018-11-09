class Takeawaydraft
  attr_accessor :dishes, :basket

  def initialize(basket = Basket.new)
    @dishes = [{ name: "Pizza", price: 20},
      { name: "Kebab", price: 12 },
      { name: "Kebab", price: 12 },
      { name: "Sushi", price: 22 },
      { name: "Burger", price: 10 }
    ]
    @basket = basket
  end  

  def see_dishes
    dishes.each do |dish|
      puts "Name: #{dish[:name]} |||| Price: £#{dish[:price]}\n"
    end
  end

  def select_dish
    loop do
      puts "What dish would you like? (type exit to complete selection)"
      select = gets.chomp.downcase
      break if select == "exit"
      
      puts "Enter quantity"
      val = gets.to_i
      dishes.each do |dish|
        dish[:quantity] = val
        basket.add(dish) if dish.has_value?(select.capitalize)
      end
    #   puts "total £#{basket.total}"
    end
  end
