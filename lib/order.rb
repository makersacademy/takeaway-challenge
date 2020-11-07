require_relative 'menu'
class Order

  attr_reader :total, :selected_items

  def initialize
    @total = 0
    @selected_items = []
  end

  def see_menu
    puts "----"
    puts "Burger £5"
    puts "Fries £3"
    puts "Drink £2"
  end

  def select(dish)
    @selected_items << dish
  end

  def view
    puts @selected_items
  end

  def place(phone)
    puts "Thank you! Your order was placed and will be delivered before 18:52"
  end

end
