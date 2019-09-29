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

   private

   def spacer
     "---------------------"
   end

   def list_dishes
     @menu.each do |dish, price|
       "#{dish} - £#{price}"
     end
   end

end
