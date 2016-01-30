class Menu

  attr_reader :pizzas, :menu

  def display_menu
    set_menu
    @pizzas.each do | item, price |
      puts "#{item}: #{price}"
    end
  end

  def set_menu
    @pizzas = { "Margherita" => 6,
                "Fiorentina" => 7,
                "Quattro stagioni" => 8,
                "Quattro formaggi" => 7,
                "Marinara" => 5}
  end

end
