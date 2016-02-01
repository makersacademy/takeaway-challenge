class Menu

  attr_reader :pizzas

  def initialize
    @pizzas = { "margherita" => 6,
                "fiorentina" => 7,
                "quattro stagioni" => 8,
                "quattro formaggi" => 7,
                "marinara" => 5}
  end

  def display_menu
    @pizzas.each {| item, price | puts "#{item}: #{price}" }
  end

end
