class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      "Meatballs" => 26,
      "Gnnoci" => 24,
      "Ravioli" => 30,
      "Canelloni" => 22,
      "Kebap" => 18
     }
  end

  def show
    @dishes.each { |dish, price| puts "#{dish} £#{price}" }
  end 
end
  