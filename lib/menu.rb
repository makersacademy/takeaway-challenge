class Menu

  attr_reader :menu

  def initialize

  @menu = [ {dish: "Crispy Shredded Beef", price: 5 },
            {dish: "Chicken Chow Mein", price: 4.50 },
            {dish: "Beef and Broccoli", price: 4.95 },
            {dish: "Spring rolls", price: 2.50 },
            {dish: "Crispy Duck Pancakes", price: 6.75 },
            {dish: "Chicken Yuk Sung" , price: 5.10 },
            {dish: "Pork Yuk Sung", price: 4.85 },
            {dish: "Singapore Noodles" , price: 3.95 }
          ]
  end

  def display_menu

  end

end
