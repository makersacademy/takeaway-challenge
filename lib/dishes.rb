class Dishes

  attr_reader :pizzas

  def initialize
    @pizzas = {Mozzarela: "$4", Mushrooms: "$6", Ham: "$5", Rocket: "$8", Calabresa: "$7"}
  end

  def print_header
    puts "Pizza Menu"
  end

  def print_list
    print_header
    @pizzas.each { |dish, price| puts "#{dish}, #{price}" }
  end

end
