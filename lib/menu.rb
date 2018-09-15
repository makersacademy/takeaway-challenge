class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      "doughnut" => 1.99,
      "cake" => 2.50,
      "pancakes" => 3.00,
      "ice-cream" => 1.99
    }
  end

  # def display_menu
  #   # @dishes.each { | dish, price | puts "#{dish}...£#{price.round(2)}" }.to_a * "\n"
  #   @dishes.each do | dish, price |
  #     puts "#{dish}...£#{price.round(2)}"
  #   end
  # end

end
