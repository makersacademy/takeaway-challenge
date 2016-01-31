require 'restaurant'

describe Restaurant do
  let(:small_order){1}
  let(:large_order){5}
  let(:menu_item){double(:menu_item, name: 'chicken satay', price: 4.50)}
  let(:order){double(:order, :add_item => true, :confirm_order => true)}
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

    it 'adds the item and quantity to the order with a default of 1' do
      allow(restaurant).to receive(:create_menu).and_return([menu_item])
      expect(order).to receive(:add_item).with(menu_item, small_order)
      restaurant.place_order(menu_item.name)
    end

    it 'adds the item and quantity to the order with a quantity specified' do
      allow(restaurant).to receive(:create_menu).and_return([menu_item])
      expect(order).to receive(:add_item).with(menu_item, large_order)
      restaurant.place_order(menu_item.name, large_order)
    end

  end

  describe '#confirm_order' do
    before do
      restaurant.show_menu
      restaurant.place_order(menu_item.name, large_order)
    end

    it 'sends a message to Order to confirm the order' do
      expect(order).to receive(:confirm_order).with(menu_item.price * large_order)
      restaurant.confirm_order(menu_item.price * large_order)
    end

  end

  describe '#show_order' do
    before do
      restaurant.show_menu
      restaurant.place_order(menu_item.name, large_order)
    end

    it 'sends a message to Order to show the order' do
      expect(order).to receive(:show_order)
      restaurant.show_order
    end

  end



end
