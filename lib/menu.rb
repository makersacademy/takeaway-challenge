class Menu
  attr_reader :dishes
  def initialize
    @dishes = {
        "Carbonara": 26,
        "Gnnoci": 24,
        "Seafood linguine": 30,
        "Lasagna": 22,
        "Pizza": 18
    }
  end

  def view_dishes
    @dishes.each { |dish, price| puts "#{dish} £#{price}" }
  end

  def available?(dish)
    @dishes.include?(dish.to_sym)
  end
end
