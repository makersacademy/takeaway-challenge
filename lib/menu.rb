# IRB SCRIPT
# irb -r ./lib/menu.rb

class Menu
  attr_reader :dishes

  DISHES = {
    1 => [:pizza, 5],
    2 => [:sausage, 3],
    3 => [:chicken, 6],
    4 => [:curry, 7],
    5 => [:family_deal, 15],
  }

  def initialize
    @dishes = DISHES
  end

end


  # def view_dishes
  #   puts "Menu"
  #   puts ""
  #   puts "Dishes"
  #   @dishes.each { |k, v| puts "#{k} - #{v[0].to_s.capitalize} - £#{v[1]}" }
  #   puts ""
  # end
