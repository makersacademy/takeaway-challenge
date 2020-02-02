require 'menu'

describe Menu do
    let(:menu) { Menu.new }
    
    it 'shows the list of items in the menu' do
        expect(menu.menu).to eq(described_class::MENU)
    end

    it 'should cost 10 for pizza' do
        expect(menu.menu["pizza"]).to eq 10
    end
end