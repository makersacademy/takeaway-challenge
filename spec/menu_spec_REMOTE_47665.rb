require './lib/menu.rb'

describe Menu do

  # let(:dish_1) { double :dish_1, name: 'Test Dish 1', description: 'Test dish 1 description', price: '10.95' }
  # let(:dish_2) { double :dish_2, name: 'Test Dish 2', description: 'Test dish 2 description', price: '5.99' }
  # let(:dish_3) { double :dish_3, name: 'Test Dish 3', description: 'Test dish 3 description', price: '2.50' }
  # let(:dish_4) { double :dish_4, name: 'Test Dish 4', description: 'Test dish 4 description', price: '12.00' }

  let(:dishes) { [
      double(:dish_1, name: 'Test Item 1', description: 'Test item 1 description', price: '10.95'),
      double(:dish_2, name: 'Test Item 2', description: 'Test item 2 description', price: '5.99'),
      double(:dish_3, name: 'Test Item 3', description: 'Test item 3 description', price: '2.50'),
      double(:dish_4, name: 'Test Item 4', description: 'Test item 4 description', price: '12.00')]
  }

  subject(:menu_empty) { described_class.new }
  subject(:menu_dish_1) { described_class.new([dishes[0]]) }

  context '#initialization' do
    it 'creates a Menu' do
      expect(menu_empty).to be_an_instance_of Menu
    end

    it 'has an empty ObjectList menu_items' do
      expect(menu_empty.menu_items).to be_an_instance_of ItemList::ItemList
    end

    it { is_expected.to respond_to(:menu_items) }

    it { is_expected.to respond_to(:add_dish) }

    it { is_expected.to respond_to(:remove_dish) }

    it { is_expected.to respond_to(:view_menu) }
  end

  context '#add_dish' do

    it 'it adds entry to menu_items' do
      expect { menu_empty.add_dish(dishes[0]) }.to change { menu_empty.menu_items.items }.to [dishes[0]]
    end

    it 'it returns success' do
      expect(menu_empty.add_dish(dishes[0])).to eq 'Success'
    end
  end

  context '#remove_dish' do
    it 'it removes entry from menu_items' do
      menu_empty.add_dish(dishes[0])
      expect { menu_empty.remove_dish(dishes[0]) }.to change { menu_empty.menu_items.items }.to []
    end

    it 'it returns success' do
      expect(menu_empty.add_dish(dishes[0])).to eq 'Success'
    end
  end

  context '#view_menu' do
    subject(:menu_full) { described_class.new }

    before(:each) do
      dishes.each { |dish|
        allow(dish).to receive(:[]).and_return("#{dish.name}", "#{dish.description}", "#{dish.price}")
        allow(dish).to receive(:keys).and_return(%w(name description price))
      }

      [dishes[0], dishes[1], dishes[2], dishes[3]].each { |dish| menu_full.add_dish(dish) }
    end

    it 'it returns a formatted string' do
      expect(menu_full.view_menu).to eq "1. Test Item 1          Test item 1 description          10.95          \n2. Test Item 2          Test item 2 description          5.99          \n3. Test Item 3          Test item 3 description          2.50          \n4. Test Item 4          Test item 4 description          12.00          "
    end
  end
end
