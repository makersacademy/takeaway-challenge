class Order
  def initialize
    @input = []
  end

   def input
    puts "please select the number of your dish and type'checkout'"
    gets.chomp
  end

  def valid_range? input
    input.to_i.between?(1..4)
  end
end