class Menu
  
  def initialize
    @menu = {
    haddock: 7,
    cod: 6,
    scampi: 5,
    large_chips: 3,
    small_chips: 2
    }
  end

   def view_menu
    "Fish & Chip Shop Menu"
     spacer
     list_dishes
     spacer
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
