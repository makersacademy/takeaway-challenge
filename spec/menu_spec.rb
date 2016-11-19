require './lib/menu'
require './lib/order'

describe Menu do

  let(:menu)  { described_class.new(order) }
  let(:klass) { double(:klass) }
  let(:order) { double(:order) }
  let(:quantity) { double(:quantity) }

  before do
    allow(order).to receive(:new).and_return order
    allow(order).to receive(:add_to_basket)
  end

  context 'Initialization' do

    it 'initializes with a list of food' do
      expect(menu.menu_list).not_to be_empty
    end

    it 'accepts order object on initialization' do
      expect(menu.order).to eq order
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
      expect(menu.menu_list['spag_bol']).to eq 6
    end

  end

  context 'Selection' do

    it 'can select an item to add to basket' do
      expect(menu).to respond_to(:select_item)
    end

    it 'returns "Not a valid item" if not in menu' do
      expect(menu.select_item("Peas", quantity)).to eq "Not a valid item"
    end

    it 'can add item, price and quantity to current selection' do
      menu.select_item("pizza", 3)
      expect(menu.current_selection).to eq ({:item=>"pizza", :price=>4, :qty=>3})
    end

    it 'adds a default quantity if no quantity is given' do
      menu.select_item("pizza")
      expect(menu.current_selection).to eq ({:item=>"pizza", :price=>4, :qty=>Menu::DEFAULT_QUANTITY})
    end

  end

  context 'Check if valid item' do

      it 'indicates when an item is not in the menu' do
        expect(menu.in_menu?("Peas")).to eq false
      end

      it 'indicates when an item is on the menu' do
        expect(menu.in_menu?("spag_bol")).to eq true
      end

  end

end
