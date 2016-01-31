

class Menu

  attr_accessor :menu_view
  def menu_view
    @menu = {
      "Chicken" =>  1.00,
      "Steak" =>  1.50,
      "Bread" =>  0.50,
      "Fish" =>  2.00
   }
  end
end
