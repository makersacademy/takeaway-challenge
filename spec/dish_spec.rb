require 'dish'

describe Dish do
  let(:Dish) { described_class }
  subject(:dish) { described_class.new(name: 'Hamburger', price: 25) }

  describe '#initialize' do
    it 'knows its name' do
      expect(dish.name).to eq('Hamburger')
    end
    it 'knows its zone' do
      expect(dish.price).to eq(25.00)
    end
  end

  describe '#update_price' do
    it 'is expected to change the price' do
      expect { dish.update_price(28) }.to change { dish.price }.by 3
    end
  end

  describe '#rename' do
    it 'is expected to change the dish name' do
      expect { dish.rename('Pizza') }.to change { dish.name }.to 'Pizza'
    end
  end
end
