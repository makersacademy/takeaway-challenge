require 'menu'

describe Menu do

  let(:menu)  { described_class.new }
  let(:quantity) { double(:quantity) }

  context 'Initialization' do

    it 'initializes with a list of food' do
      expect(menu.menu_items).not_to be_empty
    end

  end

  context 'View Menu' do

    it 'can present a user with the list of food' do
      expect(menu.view_menu).to eq menu.menu_items
    end

    it 'can present a price against a dish' do
      expect(menu.menu_items[:margherita]).to eq 6.00
    end

  end

end
