class Menu

  attr_reader :pizzas, :list

  def initialize
     @pizzas = { "Margherita" => 6,
                 "Fiorentina" => 7,
                 "Quattro stagioni" => 8,
                 "Quattro formaggi" => 7,
                 "Marinara" => 5}
  end

  def display_menu
    @pizzas.each do | item, price |
      puts "#{item}: #{price}"
    end
  end


end
