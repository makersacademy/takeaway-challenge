class Menu
  attr_reader :dishes

  def initialize
    @dishes = { pizza: 10, burger: 2, kebab: 5 }
  end

  def list
    @dishes.each do |dish, price|
      puts "#{dish}:£ #{price}"
    end
  end
end