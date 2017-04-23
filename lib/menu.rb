class Menu

  attr_reader :pizzas

  def initialize
    @pizzas = {
      :"1" => { Mozzarela: "$4" },
      :"2" => { Mushrooms: "$6" },
      :"3" => { Ham: "$5" },
      :"4" => { Rocket: "$8" },
      :"5" => { Calabresa: "$7" } }
  end

  def print_header
    puts "Pizza Menu"
  end

  def print_menu
    print_header
    @pizzas.each do |num, option|
      option.each { |dish, price| puts "#{num}. #{dish}, #{price}" }
    end
    "Choose your pizzas!"
  end

end
