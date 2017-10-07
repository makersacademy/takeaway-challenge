require './lib/menu.rb'

describe Menu do

  subject(:menu_1) { described_class.new([]) }

  let(:dish_1) { double :dish_1, name: 'Test Dish 1', description: 'Test dish 1 description', price: 10.95 }
  let(:dish_2) { double :dish_2, name: 'Test Dish 2', description: 'Test dish 2 description', price: 5.99 }
  let(:dish_3) { double :dish_3, name: 'Test Dish 3', description: 'Test dish 3 description', price: 2.50 }
  let(:dish_4) { double :dish_4, name: 'Test Dish 4', description: 'Test dish 4 description', price: 12.00 }

  context '#initialization' do
    it 'creates a Menu with a empty dishes array' do
      expect(menu_1).to be_an_instance_of Menu
    end

    # it 'should initialize with an empty dishes array' do
    #
    # end

    it { is_expected.to respond_to(:dishes) }

    it { is_expected.to respond_to(:add_dish) }

  end

  context '#add_dish' do
    it 'should add a Dish to dishes Array' do
      expect { menu_1.add_dish dish_1 }.to change { menu_1.dishes }.by [dish_1]
    end

    context 'raise_error' do
      it 'should raise_error if dish already added' do
        menu_1.add_dish(dish_1)
        expect { menu_1.add_dish(dish_1) }.to raise_error 'Menu already contains dish'
      end
    end
  end

  context '#remove_dish' do
    it 'should remove a Dish from the dishes Array' do
      menu_1.add_dish(dish_1)
      menu_1.remove_dish(dish_1)
      expect(menu_1.dishes).not_to include dish_1
    end

    context 'raise_error' do
      it 'should raise_error if dish not found' do
        expect { menu_1.remove_dish(dish_1) }.to raise_error 'Dish not found'
      end
    end
  end

end
