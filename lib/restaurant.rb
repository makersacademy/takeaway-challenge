class Restaurant
  attr_reader :menu
    
  def initialize
    @menu = { 'Margarita': 7, 'Bufala': 9, 'Neapolitan': 10 }
  end
    
  def list_menu
    @menu.each do |dish, price|
      puts "#{dish} : #{price}"
    end 
  end

end
