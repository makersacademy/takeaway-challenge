$dishes = [
{name: "Pasta", price: 3.50},
{name: "Pizza", price: 2.40}
]

class Menu
  attr_reader :selections

  def initialize(menu, order_class = Order)
    @menu = menu
    @selections = []
    @order_class = order_class
  end

  # def user_interface
  #   puts "What would you like to do?\n\n"
  #   while true
  # end

  def view
    @menu.each_with_index do |dish, i|
      puts "#{i+1}: #{dish[:name]} costs #{dish[:price]}"
    end
  end

  def select_dish(choice)
    $dishes.each do |dish|
      @selections << dish if dish[:name].downcase == choice.downcase
    end
    @selections
  end





end



# my_menu=Menu.new(dishes)
# my_menu.view
