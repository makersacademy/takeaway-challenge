require './lib/order'
require './lib/basket'

class Takeaway
  attr_accessor :dishes, :basket, :order

  def initialize(basket = Basket, order = Order)
    @dishes = [{id: 1, name: "Pizza", price: 20},
      { id: 2, name: "Kebab", price: 12 },
      { id: 4, name: "Sushi", price: 22 },
      { id: 5, name: "Burger", price: 10 }
    ]
    @basket = basket.new
    @order = order.new
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
        if dish.has_value?(select.capitalize)
          dish[:quantity] = val
          basket.add(dish)
        end
      end

    end
  end

  def place_order

    order.process(basket)
    
  #   basket.each do |dish|
  #     puts "Name: #{dish[:name]} |||| Price: £#{dish[:price]}\n"
  #   end 
  #   puts "-----------"
  #   puts "total £#{total}"
  #   puts "Thank you! Your order was placed and will be delivered before #{delivery_time} O'Clock"
  end

  # def delivery_time
  #   time = Time.new
  #   time.hour + 1
  #   "#{time.hour + 1}:#{time.minute}"
  # end
  
end
