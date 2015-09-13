require 'menu'

describe Menu do

 it 'should be able to add to menu' do
   subject
   subject.add_to_menu("pasta", 2.99)
   expect(subject.menu_list).to include("pasta"=>2.99)
 end
end
