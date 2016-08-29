require_relative 'menu'
class Order
  attr_reader :basket

  def initialize(menu_class: Menu)
    @menu_class = menu_class.new
    @basket = []
  end

  def begin_order
    order_greeting
    display_dishes

  end

  def order_greeting
    puts "What dish would you like?"
    puts "you can choose from the following:"
    puts
  end

  def record_order
    make_selection
  end

  private

  def display_dishes
    @menu_class.dishes.each do |dish,price|
      puts "#{dish} £#{price}"
    end
  end

  def make_selection
    puts "Enter your choice..."
    choice = gets.chomp.to_s
    puts "How many would you like?"
    number = gets.chomp.to_i
        number.times do
        @basket << @menu_class.dishes.select do |dish, price| dish == choice
        end
    end
  end

end
