class Menu

  attr_reader :menu

  MENU = { 1 => { :Pizza => 7 }, 
          2 => { :Pasta => 6 }, 
          3 => { :Beer => 4 } }

  def initialize(items = MENU)
    @menu = MENU
    @items = items
  end

  def list_items(items = MENU)
    pretty_menu = ""
    items.each do |key, value| 
      value.each do |item, price| 
        pretty_menu << "#{key}: #{item}, £#{price}  "
      end
    end
    sprintf pretty_menu
  end

  def item(selection)
    MENU[selection]
  end
end
