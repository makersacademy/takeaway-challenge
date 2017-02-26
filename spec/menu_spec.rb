require 'menu'

describe Menu do
  test_menu_path = File.expand_path("../../assets/menu_test.csv", __FILE__)
  let(:item_one) {double :item_one, name: "Pepperoni", price: 5}
  let(:item_output) {"Pepperoni: £5"}
  let(:menu_output) {["1. Margherita: £8", "2. Pepperoni: £10", "3. Ham & Pineapple: £12"]}
  subject(:menu) {described_class.new(Dish)}

  context 'when the menu is set to empty' do
    before do
      menu.clear_items
      allow(menu).to receive(:load_path).and_return(test_menu_path)
    end

    describe '.items' do

      it 'should add an item to the menu' do
        menu.add(item_one)
        expect(menu.items).to include item_one
      end

      it 'should clear all items from items' do
        menu.add(item_one)
        menu.clear_items
        expect(menu.items.length).to eq 0
      end

    end

    describe '.print' do
      it 'returns the details of a single item' do
        menu.add(item_one)
        expect(menu.print_item(item_one)).to eq item_output
      end
    end

    describe '.print_menu' do
      it 'returns the details of all items' do
        menu.load_items
        expect(menu.print_menu).to eq menu_output
      end
    end

  end

end
