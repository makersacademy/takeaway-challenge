
class Takeaway

  attr_reader :menu

  def initialize(menu:)
    @menu = menu
  end

  def view_menu
    @menu.print
  end


end



# [
#   { :chicken_curry => 6.5 },
#   { :beef_chow_mein => 6 },
#   { :veggie_pizza => 5.5 },
#   { :chilli_sauce => 1.5 },
#   { :fish_n_chips => 7.2 },
#   { :curly_fries => 3 },
#   { :vegan_nachos => 4.9 },
#   { :soft_drink => 2 },
#   { :beer => 3.2 }
# ]
