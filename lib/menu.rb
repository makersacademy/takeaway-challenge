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
    print
  end

  def on_menu?(dish)
    @dishes_hash.include?(dish.to_sym)
  end

  private

  def print
    @dishes_hash.each do |dish, price|
      puts "#{dish}: #{price}"
    end
  end

end
