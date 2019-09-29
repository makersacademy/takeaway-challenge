class Menu

  attr_reader :menu

  MENU = [{ item: 'Pizza', price: 11 }, { item: 'Pasta', price: 4 }]

  def initialize(menu = MENU)
    @menu = menu
  end

  def format_menu
    @menu.each_with_index do |item, index|
  
      puts "#{index + 1}. #{item[:item]} ~ £#{item[:price]}"
  
    end
  end

end
