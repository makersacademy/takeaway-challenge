class Menu

  attr_reader :dishes_hash

  def initialize 
    @dishes_hash = {
      "Green Thai Curry": 10,
      "Katsu Curry": 15,
      "Pork": 7,
      "Red Thai Curry": 10,
      "Sushi": 17
      }
  end

  def view
    @dishes_hash.each do |dish, price|
      puts "#{dish}: #{price}"
    end
  end

end
