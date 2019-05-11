class Menu

  MENU_ITEMS = {
    "Gunpowder green" => 1.80,
    "Nepalese 'silver needle' white" => 6,
    "Earl Grey" => 2.75,
    "Ssuk-cha (korean mugwort)" => 5.20,
    "Ssanghwa-cha (korean medicinal)" => 4
  }

  attr_reader :menu_items, :formatted_menu

  def initialize
    @menu_items = MENU_ITEMS
    @formatted_menu = ""
    format_menu
  end

  def view
    puts @formatted_menu
  end

  def format_menu
    @menu_items.each do |key, value|
      @formatted_menu += "\n- #{key}, £#{value}"
    end
    @formatted_menu += "\n\n"
  end

end
