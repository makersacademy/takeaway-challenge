class Menu

attr_reader :menu


  def initialize
    @menu = [{ item: 'Pizza', price: 11},{ item: 'Pasta', price: 4 }]
  end


  def format_menu
    @menu.each_with_index do |item, index|
  
      puts "#{index + 1}. #{item[:item]} ~ £#{item[:price]}"
  
    end
  end

end
