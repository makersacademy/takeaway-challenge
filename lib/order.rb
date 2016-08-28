require_relative 'menu'

#attr_reader :basket

class Order

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
  end

  private

  def display_dishes
    @menu_class.new.dishes.each do |dish,price|
      puts "#{dish} £#{price}"
      puts
    end
  end


end
