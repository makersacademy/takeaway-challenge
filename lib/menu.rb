class Menu
  attr_reader :dishes
  def initialize
    @dishes = [{
        "Carbonara": 26,
        "Gnnoci": 24,
        "Seafood Linguini": 30,
        "Lasagna": 22,
        "Pizza": 18
    }]
  end

  def view_dishes
    @dishes.each { |dish, price| p "#{dish} #{price}" }
  end

end