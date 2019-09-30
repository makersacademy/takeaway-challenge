class Menu

  def initialize
    @menu = {
    haddock: 7,
    cod: 6,
    scampi: 5,
    chips: 3
    }
  end

   def view_menu
    "Fish & Chip Shop Menu"
     spacer
     list_dishes
     spacer
   end

   def menu_list
     @menu
   end

   def dish_on_menu?(dish)
     check_menu(dish)
   end

   private

   def spacer
     "---------------------"
   end

   def list_dishes
     @menu.each do |dish, price|
       "#{dish} - £#{price}"
     end
   end

   def check_menu(dish)
     @menu.any? { |dish_key, price| dish_key == dish.to_sym }
   end

end
