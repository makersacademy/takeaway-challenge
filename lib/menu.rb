# understands csv lists of food

class Menu
  attr_reader :menu

  def initialize(cuisine = 'turkish')
    @menu = ["-------#{cuisine.upcase} MENU-------"]
    load_menu("#{cuisine}_menu.csv")
  end

  private
  
  def load_menu(filename)
    file = File.open(filename, 'r')
    menu_to_hash(file)
    file.close
  end

  def menu_to_hash(file)
    file.readlines.each do |menu_item|
      food, price = menu_item.chomp.split(',')
      @menu << { food => price.to_f }
    end
  end

end
