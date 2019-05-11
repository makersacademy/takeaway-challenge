class Menu

  MENU_ITEMS = {
    "Gunpowder green" => 1.80,
    "Silver Needle white" => 6,
    "Earl Grey" => 2.75,
    "Ssuk-cha (mugwort)" => 5.20,
    "Ssanghwa-cha (medicinal)" => 4
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

  def select_tea(input)
    @menu_items.each do |key, value|
      if key.include? input
        puts "the selected tea is: #{key}, costing £#{value}"
        return {key => value}
      end
    end
  end
end
