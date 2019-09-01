class Menu
  attr_reader :menu_items

  def initialize
    @menu_items = {
         spring_roll:3,
         char_sui_bun:4,
         pork_dumpling:5,
         peking_duck:6,
         fried_rice:7
       }
  end

  def read_menu
    @menu_items.collect do |key, value|
      "#{key}  : £#{value}"
    end
  end
end
