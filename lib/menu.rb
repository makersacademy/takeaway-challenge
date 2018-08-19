require_relative 'orders'

class Menu

  attr_reader :menu_items

  MENU_SELECTIONS = { pie: 4.50,
    sirloin_steak: 12.99,
    cranberry_juice: 2.50,
    chips: 2.50,
    boiled_egg: 0.99,
    congee: 1.99
    }

  def initialize(menu_items = MENU_SELECTIONS)
    @menu_items = menu_items
  end

  def view_menu
    @menu_items.each do |item, price|
      puts "#{item.to_s.tr("_", " ")}: £#{price}"
    end
  end

end
