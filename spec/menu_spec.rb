require 'menu'

describe Menu do 
  subject(:menu) { described_class.new }

 it 'see a list of dishes and prices ' do
   # menu = Menu.new (the code on line 4 does the same thing) 
   expect(menu.menu_list).to include "Beef £5"
 end 

end 