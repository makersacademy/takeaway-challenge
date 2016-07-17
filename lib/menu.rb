class Menu

attr_reader :menu_items

  def initialize
    @menu_items = {
              :margherita => 6.5,
              :hawaiian => 6.7,
            }
  end

  def print_list
    menu_items.map {|item, price| "%s: £%.2f" % [item.to_s.capitalize, price]}.join(", ")
  end

end
