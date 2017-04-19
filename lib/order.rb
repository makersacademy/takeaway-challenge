class Order

attr_accessor :customer_order

  def initialize
    @customer_order = []
    get_order
  end

  def get_order
    puts 'What would you like to order?'
    puts "To finish, just press enter twice"
    @dish = gets.chomp
    puts "=============#{@dish}=========="
    until @dish.empty? do
      puts "How many #{@dish}'s would you like"
      quantity = gets.chomp.to_i
      quantity.times {@customer_order << @dish}
      puts "Next dish"
      @dish = gets.chomp
    end
  end

end
