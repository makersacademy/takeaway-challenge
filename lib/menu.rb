class Menu

attr_reader :menu_items

  def initialize
    @menu_items = {
      :margherita => 6.5,
      :hawaiian => 6.7,
      :rustico => 6.8,
      :peperroni => 7.2,
      :carnivore => 8.1,
      :herbivore => 7.3,
      :quattro_stagioni => 7.2,
      :everything => 8.5
    }
  end

  def find_item_cost(item)
    menu_items[item]
  end

  def print_list
    menu_items.map {|item, price| "%s: £%.2f" % [item.to_s.capitalize, price]}.join(", ")
  end

end
