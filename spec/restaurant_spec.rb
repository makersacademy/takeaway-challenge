require 'restaurant'

describe Restaurant do
  let(:menu_item){double(:menu_item, name: 'chicken satay', price: 4.50)}
  let(:order){double(:order, :add_item => true)}
  subject(:restaurant){described_class.new(menu_item_klass, order_klass)}
  let(:menu_item_klass){double(:menu_item_klass, :new => menu_item)}
  let(:order_klass){double(:order_klass, :new => order)}


  describe '#show_menu' do

    it 'creates a list of menu items' do
      expect(menu_item_klass).to receive(:new)
      restaurant.show_menu
    end

    it 'returns a list of menu items' do
      expect(restaurant.show_menu).to include(menu_item)
    end

  end

  describe '#place_order' do
    before {restaurant.show_menu}

    it 'creates an instance of Order' do
      expect(order_klass).to receive(:new)
      restaurant.place_order(menu_item.name)
    end

    it 'adds the item and quantity to the order with a default of 1' do
      allow(restaurant).to receive(:create_menu).and_return([menu_item])
      expect(order).to receive(:add_item).with(menu_item, 1)
      restaurant.place_order(menu_item.name)
    end

    it 'adds the item and quantity to the order with a quantity specified' do
      allow(restaurant).to receive(:create_menu).and_return([menu_item])
      expect(order).to receive(:add_item).with(menu_item, 5)
      restaurant.place_order(menu_item.name, 5)
    end


  end


end
