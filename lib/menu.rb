class Menu

  attr_reader :items

  def initialize
    @items = { 
      burger: 6.50,
      chips: 3.50,
      wings: 5.20,
      curry: 6.70,
      pizza: 7.50
    }
  end

  def view_menu
    @items
  end

  def on_menu?(item)
    items.key?(item)
  end 

end