class Order

  attr_reader :menu

  def initialize
    @menu = [{ food: "Chick'n Burger", price: 7 },
             { food: "Chick'n Spicy Burger", price: 7 },
             { food: "Hamburger Deluxe", price: 6 },
             { food: "Hamburger Cheese", price: 5 },
             { food: "Fries", price: 2 },
             { food: "Mac 'n Cheese", price: 5 },
             { food: "Coleslaw", price: 3 },
             { food: "Gravy", price: 1 }]
  end

  def list_menu
    @menu.each_with_index { |menu, index| puts "#{index + 1}: #{menu[:food]} £#{menu[:price]}" }
  end

end
