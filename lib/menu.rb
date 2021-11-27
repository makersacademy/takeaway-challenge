 MEALS = {
    1 => [ "Kimbab", 8 ],
    2 => [ "KFC", 6 ],
    3 => [ "Bibimbab_beef" , 12.50 ] ,
    4 => [ "Bibimba_chicken" , 10 ] ,
    5 => [ "Pork_bulgogi" , 10 ] ,
    6 => [ "Kimchi" , 4 ] ,
    7 => [ "Patato_salad" , 5 ] ,
    8 => [ "Kimchi_pancake" , 5 ] ,
    9 => [ "Rice" , 3 ],
    10 => [ "Exit menu" ],
    11 => [ "Checkout" ]
}

class Menu
  def initialize
    @basket = []
    @receipt = []
    interactive_menu
  end

  def interactive_menu
    loop do
      print_menu
      meal_number = STDIN.gets.chomp.to_i
      process(meal_number)
    end
  end

  def print_menu
    puts "Welcome, this is our menu".center(40)
    puts "Please enter the number of the meal you would like to add to the basket"
    # puts "Press enter twice when you're done"
    puts "___________________________________________________________"
    puts
    MEALS.each do |key , value|
      puts "#{key} to select #{value[0]} : £#{value[1]}".center(40)
    end
    puts "__________________________________________________________"
  end

  def process(meal_number)
    @meal_number = meal_number
    if @meal_number.nil? || @meal_number < MEALS.keys[0] || @meal_number > MEALS.keys[-1]
      "sorry we don't have this item. Pick a meal from the menu, please"
      interactive_menu
    elsif @meal_number == MEALS.keys[-2]
        exit
    elsif @meal_number == MEALS.keys[-1]
        checkout
    else
      add_to_basket
      add_to_receipt
    end
  end

  def add_to_basket
    # p chosen_meal = MEALS[@meal_number][0]
    @basket << MEALS[@meal_number][0]
    p @basket
  end

  def add_to_receipt
    # p price = MEALS[@meal_number][1]
     @receipt << MEALS[@meal_number][1]
    p @receipt
  end
end

#interactive_menu