require_relative 'menu'

class Restaurant

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def print_menu
    puts "*Welcome to ChickenShawp, choose from our menu:*"
    menu.dishes.each do |dish|
      puts "#{dish[:name]}, #{dish[:price]}"
    end
  end
end
