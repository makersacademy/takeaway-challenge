class Menu

  attr_reader :menu, :meal

  def initialize
    @menu = [ {dish_no: 1, dish_name: "Crispy Shredded Beef", dish_price: 5 },
              {dish_no: 2, dish_name: "Chicken Chow Mein", dish_price: 4.50 },
              {dish_no: 3, dish_name: "Beef and Broccoli", dish_price: 4.95 },
              {dish_no: 4, dish_name: "Spring rolls", dish_price: 2.50 },
              {dish_no: 5, dish_name: "Crispy Duck Pancakes", dish_price: 6.75 },
              {dish_no: 6, dish_name: "Chicken Yuk Sung" , dish_price: 5.10 },
              {dish_no: 7, dish_name: "Pork Yuk Sung", dish_price: 4.85 },
              {dish_no: 8, dish_name: "Singapore Noodles" , dish_price: 3.95 }
            ]
    @meal = []
  end

  def display_menu
    menu
  end

  def select_dish(dish_no)
    @meal << menu[dish_no - 1]
  end

  def order_meal

  end

end
