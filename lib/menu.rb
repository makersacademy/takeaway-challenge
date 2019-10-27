class Menu
  attr_reader :menu

  def initialize                                     
    @menu = { 
      curry: 9.99,
      rice: 2.99,
      naan: 3,
      pepsi: 0.99
      }
  end

  def display_menu
    puts "Menu Options:"
    @menu.each { |dish, price| puts "#{dish.capitalize}: £#{price}" }
  end
  
end
