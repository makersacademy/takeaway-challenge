require 'menu'

describe Menu do 
   subject(:menu) {described_class.new}
   it 'displays list of dishes and their prices' do
        expect(menu.view_menu).to include "Fire-sauce fillet:"
        #expect(dishes.length).to eq(5)
    end
end
