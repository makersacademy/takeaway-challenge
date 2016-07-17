class Menu

  def display_menu
  end

  def select_dishes(dish, quantity)
  end
end


  # attr_reader :meal
  #
  # CHINESE_MENU = [ {dish_no: 1, dish_name: "Crispy Shredded Beef", dish_price: 5 },
  #                  {dish_no: 2, dish_name: "Chicken Chow Mein", dish_price: 4.50 },
  #                  {dish_no: 3, dish_name: "Beef and Broccoli", dish_price: 4.95 },
  #                  {dish_no: 4, dish_name: "Spring rolls", dish_price: 2.50 },
  #                  {dish_no: 5, dish_name: "Crispy Duck Pancakes", dish_price: 6.75 },
  #                  {dish_no: 6, dish_name: "Chicken Yuk Sung" , dish_price: 5.10 },
  #                  {dish_no: 7, dish_name: "Pork Yuk Sung", dish_price: 4.85 },
  #                  {dish_no: 8, dish_name: "Singapore Noodles" , dish_price: 3.95 }
  #               ]
  #
  # def initialize
  #   @meal = []
  # end
  #
  # def display_menu
  #   # template = "Dish No. - %{dish_no}  Dish Name - %{dish_name}  Dish Price - £%{dish_price}"
  #   # string_menu = MENU.each { |dish| puts template % dish }
  #   CHINESE_MENU
  # end
  #
  # def select_dish
  #   order = { dish: nil, quantity: nil }
  #   puts "Please enter the dish number you would like to order"
  #   dish_no = gets.chomp.to_i
  #   order[:dish] = MENU[dish_no - 1]
  #   puts "Please enter the quantity you would like to order"
  #   quantity = gets.chomp.to_i
  #   order[:quantity] = quantity
  #   @meal << order
  # end
  #
  # def order_total
  #   order_total = meal.map {|element| element[:dish][:dish_price] * element[:quantity]}.reduce(0, :+)
  # end
  #
  # def order_meal
  #
  # end
