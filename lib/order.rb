class Order
  def initialize
    input
    check_input
  end

  def input
    puts 'please select the number of your dish'
    gets.chomp
  end

  def check_input
  end
end
