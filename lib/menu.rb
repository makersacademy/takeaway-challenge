class Menu
  def initialize
  end

  def display_menu
    temp = []
    menu_hash.each do |key, value| 
      temp << "#{key}: £#{value}"
    end
    temp.join("\n")
  end

  private

  def menu_hash
    menu_hash = {
      Fish: 7,
      Chips: 3
    }
    menu_hash
  end
end
