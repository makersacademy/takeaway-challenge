class Menu
  
  attr_reader :list
  
  def initialize 
    @list = [{ name: 'Pizza Margherita', price: 5 },
    { name: 'Pizza Marinara', price: 4 },
    { name: 'Pizza Capricciosa', price: 6 },
    { name: 'Ripieno', price: 6 }]
  end

  def display_menu
    @list.each { |item| puts "#{item[:name]}  £#{item[:price]}" }
  end

end
