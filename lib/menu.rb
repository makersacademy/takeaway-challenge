class Menu

  attr_reader :meal

  CHINESE_MENU = [ {dish_no: 1, dish_name: "Crispy Shredded Beef", dish_price: 5 },
                   {dish_no: 2, dish_name: "Chicken Chow Mein", dish_price: 4.50 },
                   {dish_no: 3, dish_name: "Beef and Broccoli", dish_price: 4.95 },
                   {dish_no: 4, dish_name: "Spring rolls", dish_price: 2.50 },
                   {dish_no: 5, dish_name: "Crispy Duck Pancakes", dish_price: 6.75 },
                   {dish_no: 6, dish_name: "Chicken Yuk Sung" , dish_price: 5.10 },
                   {dish_no: 7, dish_name: "Pork Yuk Sung", dish_price: 4.85 },
                   {dish_no: 8, dish_name: "Singapore Noodles" , dish_price: 3.95 }
                ]

  def initialize
    @meal = []
  end

  def display_menu
    template = "Dish No. - %{dish_no}  Dish Name - %{dish_name}  Dish Price - £%{dish_price}"
    string_menu = CHINESE_MENU.each { |dish| puts template % dish }
    CHINESE_MENU
  end

  def select_dish(dish_no, quantity)
    order = { dish: nil, quantity: nil }
    order[:dish] = CHINESE_MENU[dish_no - 1]
    order[:quantity] = quantity
    @meal << order
  end

  def order_total
    @order_total = meal.map {|element| element[:dish][:dish_price] * element[:quantity]}.reduce(0, :+)
  end

  def order_meal(order_total)
    send_SMS("Thank you for your order: £#{order_total}")
  end

  def send_SMS(message)
    Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
       .messages.create(
         from: ENV['TWILIO_PHONE'],
         to: ENV['TWILIO_DESTINATION_PHONE'],
         body: message
       )
  end
end
