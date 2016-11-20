require './lib/menu'

describe Menu do

  let(:menu)  { described_class.new }
  let(:quantity) { double(:quantity) }

  context 'Initialization' do

    it 'initializes with a list of food' do
      expect(menu.menu_list).not_to be_empty
    end

    it 'creates an empty current selection' do
      expect(menu.current_selection).to eq ({})
    end

  end

  context 'Menu' do

    it 'can present a user with the list of food' do
      expect(menu.view_menu).to eq menu.menu_list
    end

    it 'can present a price against a dish' do
      expect(menu.menu_list['Spag_Bol']).to eq 6.5
    end

  end

  context 'Selection' do

    it 'returns "Not a valid item" if not in menu' do
      expect(menu.select_item("Peas", quantity)).to eq "Not a valid item"
    end

    it 'can add item, price and quantity to current selection' do
      menu.select_item("Pizza", 3)
      expect(menu.current_selection).to eq ({:item=>"Pizza", :price=>4, :qty=>3})
    end

    it 'adds a default quantity if no quantity is given' do
      menu.select_item("Pizza")
      expect(menu.current_selection).to eq ({:item=>"Pizza", :price=>4, :qty=>Menu::DEFAULT_QUANTITY})
    end

    it 'confirms items that have been added to basket' do
      expect(menu.select_item("Pizza", 3)).to eq "3x Pizza added to your basket"
    end

  end

  # context 'Check if valid item' do
  #
  #     it 'indicates when an item is not in the menu' do
  #       expect(menu.in_menu?("Peas")).to eq false
  #     end
  #
  #     it 'indicates when an item is on the menu' do
  #       expect(menu.in_menu?("spag_bol")).to eq true
  #     end
  #
  # end

end
