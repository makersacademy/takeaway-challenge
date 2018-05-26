class Menu

  attr_reader :items

  def initialize 
    @items = [
      "Chicken Curry",
      "Spring rolls",
      "Beef Noodles",
      "Pork belly"
    ]
  end

  def view_menu
    @items 
  end
end