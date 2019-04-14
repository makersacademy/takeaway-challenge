class Dishes
  attr_reader :menu
  
  def initialize
    @menu = { fish: 5, chips: 2, curry_sauce: 1 }
  end
  
  def view
    menu.each do |key, value|
      puts "#{key} - £#{value}"
    end
  end
end
