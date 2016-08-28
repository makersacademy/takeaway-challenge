require_relative 'menu'
class Order
  attr_reader :basket

  def initialize(menu_class: Menu)
    @menu_class = menu_class
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
    choice = gets.chomp
    @basket << choice
  end

  private

  def display_dishes
    @menu_class.new.dishes.each do |dish,price|
      puts "#{dish} £#{price}"
      puts
    end
  end


end
