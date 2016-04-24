class Menu
attr_reader :menu_list
  def initialize
    @menu_list = {chiken_foo_young: 4,
    chilli_spicy_chiken: 3,
    chrispy_lamb: 5,
    kung_po_lamb: 6,
    stir_fried_scallops: 8 }
  end

  def display_menu
    @menu_list
  end
end
