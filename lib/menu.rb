class Menu

  attr_reader :menu_items

  def initialize
    @menu_items = [
      {item_num: 1, item: "Murgh Masala", cost: 6.9},
      {item_num: 2, item: "Avo Chick Moricha", cost: 7.25},
      {item_num: 3, item: "Tandori King Prawn Masala", cost: 8.5}
    ]
  end

  def view_menu
    #"Menu:\n\n" +
    readable_menu = "Avo Spice Menu:\n"
    menu_items.each do |item|
        readable_menu += "#{item[:item_num]}) #{item[:item]} - #{item[:cost]}\n"
    end
    readable_menu
  end
end
