
class Menu

   DISH_NUMBERS = {1=>"Fried Spring Rolls",2=>"Crispy Prawns",3=>"Thai Calamari",4=>"Chicken Satay",5=>"Beef Mussaman Curry",6=>"Thai Green Curry",7=>"Pineapple Fried Rice",8=>"Salmon Red Curry",9=>"Pad Thai",10=>"Steamed Jasmine Rice",11=>"Egg Fried Rice",12=>"Plain Noodles",13=>"Steamed Coconut Rice"}
   ITEM_PRICE = {1=>6.25, 2=>7.50, 3=>6.25, 4=>7.50, 5=>11.00, 6=>12.00, 7=>12.50, 8=>12.00, 9=>10.00, 10=>2.50, 11=>3.50, 12=>4.00, 13=>4.00 }

  Dishes  =
  " 1..Fried_spring_rolls... 6.25,
    2..Crispy_prawns...	7.50,
    3..Thai calamari...	6.25,
    4..Chicken satay... 7.50,
    5..Beef mussaman curry... 11.00,
    6..Thai green curry... 12.00,
    7..Pineapple fried rice... 12.50,
    8..Salmon red curry...	12.00,
    9..Pad Thai... 10.00,
    10..Steamed Jasmine Rice...	2.50,
    11..Egg Fried Rice... 3.50,
    12..Plain Noodles... 4.00,
    13..Steamed coconut rice... 4.00 "

    def initialize(customer_choice = Order)
      @customer_choice = customer_choice
      @current_order = nil
    end

    def show
    p Dishes
  end

  def choose(menu_items)
    p 'Please select which item numbers you would like from the menu'
    @current_order = @customer_choice.new if @current_order == nil
    current_order.menu_items(items)
  end
end
