require 'menu'

describe Menu do

 xit 'should be able to add to menu' do
   subject
   subject.add_to_menu("pasta", 2.99)
   expect(subject.menu).to include("pasta", 2.99)
 end
end
