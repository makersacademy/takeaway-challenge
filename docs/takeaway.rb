require './docs/menu.rb'

class Takeaway
  attr_reader :basket, :menu, :tally

  def initialize
    @menu = Menu.new
    @basket = []
    @tally = 0
  end

  def header
    puts "Welcome to the God of Cookery Takeaway.\n Choose an option"
    puts "1. See menu"
    puts "2. Choose dishes"
    puts "3. Basket"
    puts "4. Exit"
  end

  def show_menu
    @menu.display
  end

  def choose_dish(number, quantity = 1)
    invalid_choice(number, quantity)
    quantity.times { @basket << @menu.items.keys[number - 1] }
    quantity.times { @tally += @menu.items.values[number] }
  end

  def invalid_choice(number, quantity)
    raise("Invalid choice") if number > @menu.items.size
    raise("Invalid choice") if quantity < 1
  end

  def show_basket
    @basket.uniq.map { |dishes| puts "#{dishes} x #{@basket.count(dishes)}" }
    puts total
  end

  def total
    puts "Total £#{@tally}"
  end
end
