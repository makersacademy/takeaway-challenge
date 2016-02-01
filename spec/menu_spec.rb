require 'menu'

describe Menu do
    subject(:menu){described_class.new}
    
    it 'should provide a list of available dishes' do
        expect(subject.view_menu).to eq Menu::MENU_ITEMS
    end
end