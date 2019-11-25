class Menu
  attr_reader :list_of_dishes
  
  def initialize 
    @list_of_dishes = {
      "Fish" => "3£",
      "Chicken" => "2£",
      "Pasta" => "4£",
      "Bread" => "1£"
    }
  end
  
  def show_menu
    puts "±±±± Menu : \n\n"
    @list_of_dishes.each { |item, cost| puts "#{item} #{cost}" }
  end
  
end