require './lib/menu'

describe Menu do

  let(:menu)  { described_class.new({:Pizza=>4, :Spag_Bol=>6.5, :Chips=>2.75}) }
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
      expect(menu.view_menu[:Spag_Bol]).to eq 6.5
    end

  end

end
