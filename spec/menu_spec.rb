require 'menu'

describe 'Menu' do

  subject(:menu) { Menu.new }

  describe "#display_menu" do
    it 'displays the menu' do
      expect(menu.display_menu.keys[0]).to eq("margherita")
    end

    it 'displays the prices' do
      expect(menu.display_menu.values[0]).to eq(6)
    end
  end
end
