class Menu
  attr_reader :order, :total, :sum

  def initialize
    @order = []
    @sum = 0
    @total = 0
  end

  def list_food
    @menu = {
      "pizza" => 10,
      "lasagna" => 8,
      "rigatoni" => 15,
      "spaghetti" => 7,
      "salad" => 5,
      "burrata" => 6
    }
  end

  def correct?
    @total == @sum
  end

  def make_order
    welcome_message
    loop do
      puts 'What would you like?'
      food = get_input
      break if food == 'complete'
      if self.list_food.key?(food)
        puts 'Quantity?'
        quantity = get_input.to_i
        @order << "#{quantity} #{food}"
        @sum += quantity
      else
        puts 'Please enter a food from the menu'
      end
    end
    puts 'In total how many items did you order?'
    @total = gets.chomp.to_i
    goodbye_message
  end
end

private
  def welcome_message
    puts "Welcome in our restaurant! Here you can order your delicious food. To complete your order just type in the word complete. Thank you."
  end

  def goodbye_message
    puts "Thank you for your order! This is what you've ordered:"
    @order
  end

  def get_input
    gets.chomp
  end
