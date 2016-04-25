class Menu
attr_reader :menu_list
  def initialize
    @menu_list = {chicken_foo_young: 4,
    chilli_spicy_chicken: 3,
    crispy_lamb: 5,
    kung_po_lamb: 6,
    stir_fried_scallops: 8 }
  end

  def display_menu
    @menu_list
  end
end
