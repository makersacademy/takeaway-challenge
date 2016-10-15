class Menu

  def initialize(menu)
    @menu = menu
  end

  def check_stock(choice)
    chosen_item = find_item(choice)
    raise "Sorry, we do not sell this item" if chosen_item[0].nil?
    chosen_item[0]
  end

  def find_item(choice)
    @menu.select{|menu_item| menu_item[:name] == choice}
  end

end
