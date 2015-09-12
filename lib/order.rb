require_relative 'menu'

class Order
  attr_reader :orders
  def initialize
    @orders = []
    @hash = Hash.new
  end

  def greet
    puts "Thank you for visiting our takeaway website."
    puts "please take a look at our menu."
  end

  def present(menu)
    menu.show
  end
  #
  def choose_dish
    puts "What would you like to order? Please enter a menu item number."
    @menu_num = gets.chomp.to_i
  end
  #
  def choose_how_many
    puts "How many of dishes do you want?"
    @quantities = gets.chomp.to_i
  #   @hash[menu.menu[@menu_num - 1].keys[0]] = @quantities
  end

  def cart(menu)
    orders << menu.menu[@menu_num - 1].merge({quantities: @quantities})
  end

  # def check_orders
  #   orders.each do |order|
  #     puts "Dish       Quantities        Price       total"
  #     puts "#{@dish}:           #{order[:quantities]}            #{order[@dish]}           #{order[:quantities] * order[@dish]}"
  #   end
  # end
end
