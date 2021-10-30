require 'menu'

describe Menu do 
  subject(:menu) { described_class.new }

 it 'see a list of dishes and prices ' do
   menu = Menu.new
   expect(menu.menu_list).to include "Beef £5"
 end 

end 