require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new(menu) }
  let(:menu) { Menu.new }
  let(:fish) { Dish.new("Cod",14.99) }

  describe 'class methods' do
    it { is_expected.to(respond_to(:show_menu)) }
    it { is_expected.to(respond_to(:order_item).with(1).argument) }
  end

  describe '#show_menu' do
    it 'should print out menu' do
      allow(menu).to receive(:print_menu).and_return("Cod - £14.99")
      expect(restaurant.show_menu).to eq("Cod - £14.99")
    end
  end

  describe '#order_item' do
    it 'should select the ordered item' do
      allow(menu).to receive(:menu_items).and_return({"Cod" => 14.99})
      expect(restaurant.order_item("Cod")).to eq(menu.menu_items)
    end

    it 'should raise error if item is not on menu' do
      allow(menu).to receive(:menu_items).and_return({"Cod" => 14.99})
      expect{ restaurant.order_item("Pikachu") }.to raise_error("Pikachu is not on the menu")
    end
  end
end
