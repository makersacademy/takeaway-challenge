
class Menu

  attr_reader :basket, :receipt_list, :meals_list

  MEALS_LIST =
  {
    1 => ["Kimbab", 8],
    2 => ["KFC", 6],
    3 => ["Bibimbab_beef", 12.50],
    4 => ["Bibimba_chicken", 10],
    5 => ["Pork_bulgogi", 10],
    6 => ["Kimchi", 4],
    7 => ["Patato_salad", 5],
    8 => ["Kimchi_pancake", 5],
    9 => ["Rice", 3],
    10 => ["Exit menu"],
    11 => ["Checkout"]
  }

# method is meant for feature tests
# it automatically print the menu and awaits user input
  def initialize
    @basket = []
    @receipt_list = []
    # interactive_menu
  end

# # interactive menu and print_menu can be tested in irb only
#   def interactive_menu
#     loop do
#       print_menu
#       meal_number = STDIN.gets.chomp.to_i
#       meal_number = gets.chomp.to_i
#     #   process(meal_number)
#     end
#   end

  def print_menu
    print MEALS_LIST
    # puts "Welcome, this is our menu".center(50)
    # puts "Please enter the number of the meal you would like to add to the basket"
    # # puts "Press enter twice when you're done"
    # puts "___________________________________________________________"
    # puts
    # MEALS.each do |key , value|
    #   puts "#{key} to select #{value[0]} : £#{value[1]}".center(50)
    # end
    # puts "__________________________________________________________"
  end

  def choose_meal(meal_number)
    # TODO : Has too many lines
    @meal_number = meal_number
    # raise "Please, input the meal number" unless @meal_number.is_a?(Integer)
    if !(@meal_number.is_a?(Integer)) || @meal_number.nil?
      raise "Please, input the meal number"
    elsif @meal_number < MEALS_LIST.keys[0] || @meal_number > MEALS_LIST.keys[-1]
      raise "sorry we don't have this item. Pick a meal from the menu, please"
      #interactive_menu
    elsif @meal_number == MEALS_LIST.keys[-2]
      exit
    elsif @meal_number == MEALS_LIST.keys[-1]
      checkout
    else
      add_to_basket
      add_to_receipt
    end
  end
  

  def add_to_basket
    @basket << MEALS_LIST[@meal_number][0]
  end

  def add_to_receipt
    @receipt_list << MEALS_LIST[@meal_number][1]
  end
end

# interactive_menu
