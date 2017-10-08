require './lib/menu.rb'

describe Menu do

  let(:dish_1) { double :dish_1, name: 'Test Dish 1', description: 'Test dish 1 description', price: 10.95 }
  let(:dish_2) { double :dish_2, name: 'Test Dish 2', description: 'Test dish 2 description', price: 5.99 }
  let(:dish_3) { double :dish_3, name: 'Test Dish 3', description: 'Test dish 3 description', price: 2.50 }
  let(:dish_4) { double :dish_4, name: 'Test Dish 4', description: 'Test dish 4 description', price: 12.00 }

  subject(:menu_empty) { described_class.new }
  subject(:menu_dish_1) { described_class.new([dish_1]) }

  context '#initialization' do
    it 'creates a Menu' do
      expect(menu_empty).to be_an_instance_of Menu
    end

    it 'has an empty ObjectList menu_items' do
      expect(menu_empty.menu_items).to be_an_instance_of ItemList
    end

    it { is_expected.to respond_to(:menu_items) }

    it { is_expected.to respond_to(:add_dish) }

    it { is_expected.to respond_to(:remove_dish) }

    it { is_expected.to respond_to(:view_menu) }
  end

  context '#add_dish' do

    it 'it adds entry to menu_items' do
      expect { menu_empty.add_dish(dish_1) }.to change { menu_empty.menu_items.items }.to [dish_1]
    end

    it 'it returns success' do
      expect(menu_empty.add_dish(dish_1)).to eq 'Success'
    end
  end

  context '#remove_dish' do
    it 'it removes entry from menu_items' do
      menu_empty.add_dish(dish_1)
      expect { menu_empty.remove_dish(dish_1) }.to change { menu_empty.menu_items.items }.to []
    end

    it 'it returns success' do
      expect(menu_empty.add_dish(dish_1)).to eq 'Success'
    end
  end

  context '#view_menu' do
    subject(:menu_full) { described_class.new }

    before(:each) do
      menu_full.add_dish(dish_1)
      menu_full.add_dish(dish_2)
      menu_full.add_dish(dish_3)
      allow(dish_1).to receive(:map).and_return(['Test Dish 1          ', 'Test dish 1 description          ', '10.95          '])
      allow(dish_2).to receive(:map).and_return(['Test Dish 2          ', 'Test dish 2 description          ', '5.99          '])
      allow(dish_3).to receive(:map).and_return(['Test Dish 3          ', 'Test dish 3 description          ', '2.50          '])
    end

    it 'it returns a formatted string' do
      expect(menu_full.view_menu).to eq "1. Test Dish 1          Test dish 1 description          10.95          \n2. Test Dish 2          Test dish 2 description          5.99          \n3. Test Dish 3          Test dish 3 description          2.50          "
    end
  end
end
