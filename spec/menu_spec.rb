require 'menu'

describe Menu do
  let(:dish) { double(:dish, price: 5, name: 'dish') }
  let(:dish_klass) { double(:dish_klass, new: dish) }
  subject(:menu) do
    described_class.new(dish_klass: dish_klass)
  end

  describe '#add' do
    it 'adds a new dish to the menu' do
      menu.add('dish', 5)
      expect(menu.dishes).to include dish
    end

    it 'raises an error if dish already exists' do
      menu.add('dish', 5)
      already_exists = described_class::ALREADY_EXISTS_ERROR
      expect { menu.add('dish', 9) }.to raise_error already_exists
    end
  end

  describe '#remove' do
    it 'removes the dish from the menu' do
      allow(dish).to receive(:name).and_return('dish')
      menu.add('dish', 5)
      menu.remove('dish')
      expect(menu.dishes).not_to include dish
    end

    it 'raises an error if the dish doesn\'t exist' do
      doesnt_exist = described_class::DOES_NOT_EXIST_ERROR
      expect { menu.remove('dish') }.to raise_error doesnt_exist
    end
  end

  describe '#update_price' do
    it 'Changes the price of a dish' do
      menu.add('dish', 5)
      expect(dish).to receive(:update_price)
      menu.change_price('dish', 6)
    end
  end

  describe '#change_name' do
    it 'Changes the name of a dish on the menu' do
      menu.add('dish', 5)
      expect(dish).to receive(:rename)
      menu.change_name('dish', 6)
    end
  end
end
