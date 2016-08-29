require_relative 'menu'
class Order
  attr_reader :basket, :end_price, :absolute_total

  def initialize(menu_class: Menu)
    @menu_class = menu_class.new
    @basket = []
  end

  def begin_order
    order_greeting
    display_dishes
    record_order

  end

  def total
    @count = 0
    while @count < basket.length
      absolute_total = 0
      end_price = 0
      @basket.each do |hash|
        hash.each do |key, value|
          end_price = end_price + value.to_i
          @absolute_total = end_price
          @count += 1
          end
        end
      end
      @absolute_total
  end

  def order_greeting
    puts "What dish would you like?"
    puts "you can choose from the following:"
    puts
  end

  def record_order
    puts "Enter your choices... when done just press 'enter' twice"
    make_selection
  end

  private

  def display_dishes
    @menu_class.dishes.each do |dish,price|
      puts "#{dish} £#{price}"
    end
  end

  def make_selection
    while user_input = gets.chomp.to_s # loop while getting user input
      case user_input
      when ""
        return
      else
    puts "How many would you like?"
    number = gets.chomp.to_i
        number.times do
        @basket << @menu_class.dishes.select do |dish, price| dish == user_input
        end
      end
    end
  end
end
end
