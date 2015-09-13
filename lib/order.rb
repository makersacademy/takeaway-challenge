require_relative 'menu'
require_relative 'text'

class Order
  include Text
  attr_reader :orders
  def initialize
    @orders = []
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
  end

  def cart(menu)
    orders << menu.menu[@menu_num - 1].merge({quantities: @quantities})
  end

  def check_orders
    puts "Dish   Quantities  Price  total"
    orders.each do |order|
      puts "#{order[:dish]}      #{order[:quantities]}         #{order[:price]}    #{order[:quantities] * order[:price]}"
    end
    puts "The total price is #{total_price}"
  end

  def execute_orders
    orders.map do |order|
      order[:paid] = true
      order[:ordered_at] = Time.now.strftime("%b %e, %Y %H:%M")
    end
    Text.send_text_message
    orders
  end

  private

  def total_price
    sum = 0
    orders.each do |order|
      sum += order[:price] * order[:quantities]
    end
    sum
  end
end
