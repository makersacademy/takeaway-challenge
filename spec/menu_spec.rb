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

    it 'has an empty object_list injected' do
      expect(menu_empty.dishes_list).to be_an_instance_of ObjectList
    end

    it { is_expected.to respond_to(:dishes_list) }

    it { is_expected.to respond_to(:add_dish) }

    it { is_expected.to respond_to(:remove_dish) }

    it { is_expected.to respond_to(:view_menu) }
  end

  context '#add_dish' do

    it 'it adds entry to dishes_list' do
      expect { menu_empty.add_dish(dish_1) }.to change { menu_empty.dishes_list.objects }.to [dish_1]
    end

    it 'it returns success' do
      expect(menu_empty.add_dish(dish_1)).to eq 'Success'
    end
  end

  context '#remove_dish' do
    it 'it removes entry from dishes_list' do
      menu_empty.add_dish(dish_1)
      expect { menu_empty.remove_dish(dish_1) }.to change { menu_empty.dishes_list.objects }.to []
    end

    it 'it returns success' do
      expect(menu_empty.add_dish(dish_1)).to eq 'Success'
    end
  end

  context '#view_menu' do

  end
end
