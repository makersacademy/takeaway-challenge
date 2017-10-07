require './lib/menu.rb'

describe Menu do

  subject(:menu_empty) { described_class.new([]) }
  subject(:menu_dish_1) { described_class.new([dish_1]) }
  subject(:menu_all_dishes) { described_class.new([dish_1, dish_2, dish_3, dish_4]) }

  let(:dish_1) { double :dish_1, name: 'Test Dish 1', description: 'Test dish 1 description', price: 10.95 }
  let(:dish_2) { double :dish_2, name: 'Test Dish 2', description: 'Test dish 2 description', price: 5.99 }
  let(:dish_3) { double :dish_3, name: 'Test Dish 3', description: 'Test dish 3 description', price: 2.50 }
  let(:dish_4) { double :dish_4, name: 'Test Dish 4', description: 'Test dish 4 description', price: 12.00 }

  context '#initialization' do
    it 'creates a Menu with a empty dishes array' do
      expect(menu_empty).to be_an_instance_of Menu
    end

    # it 'should initialize with an empty dishes array' do
    #
    # end

    it { is_expected.to respond_to(:dishes) }

    it { is_expected.to respond_to(:add_dish) }

    it { is_expected.to respond_to(:remove_dish) }

    it { is_expected.to respond_to(:view_menu) }
  end

  context '#add_dish' do
    it 'should add a Dish to dishes Array' do
      expect { menu_empty.add_dish dish_1 }.to change { menu_empty.dishes }.by [dish_1]
    end

    context 'raise_error' do
      it 'should raise_error if dish already added' do
        expect { menu_dish_1.add_dish(dish_1) }.to raise_error 'Menu already contains dish'
      end
    end
  end

  context '#remove_dish' do
    it 'should remove a Dish from the dishes Array' do
      menu_dish_1.remove_dish(dish_1)
      expect(menu_dish_1.dishes).not_to include dish_1
    end

    context 'raise_error' do
      it 'should raise_error if dish not found' do
        expect { menu_empty.remove_dish(dish_1) }.to raise_error 'Dish not found'
      end
    end
  end

  context '#view_menu' do
    it 'should return a list of dishes' do
      expect(menu_all_dishes.view_menu).to eq [dish_1, dish_2, dish_3, dish_4]
    end
  end
end
