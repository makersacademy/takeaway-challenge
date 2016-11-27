require './lib/menu'

describe Menu do

  let(:menu)  { described_class.new({"Pizza"=>4, "Spag_Bol"=>6.5, "Chips"=>2.75}) }
  let(:quantity) { double(:quantity) }

  context 'Initialization' do

    it 'initializes with a list of food' do
      expect(menu.menu_list).not_to be_empty
    end

  end

  context 'View Menu' do

    it 'can present a user with the list of food' do
      expect(menu.view_menu).to eq menu.menu_list
    end

    it 'can present a price against a dish' do
      expect(menu.view_menu["Spag_Bol"]).to eq 6.5
    end

  end

  context 'Check if valid item' do

    it 'indicates when an item is not in the menu' do
      expect(menu.in_menu?("Peas")).to eq false
    end

    it 'indicates when an item is on the menu' do
      expect(menu.in_menu?("Spag_Bol")).to eq true
    end

  end

  context 'Check price of item' do

    it 'returns the price of an item' do
      expect(menu.check_price("Spag_Bol")).to eq 6.5
    end

  end
end
