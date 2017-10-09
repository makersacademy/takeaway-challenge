require './lib/dish.rb'

describe Dish do

  subject(:dish) { described_class.new(name: 'Test Dish 1', description: 'Test description.', price: '10.95') }

  context '#initialization' do
    it 'creates a Dish with a name, description, and price' do
      expect(dish).to be_an_instance_of Dish
    end

    it { is_expected.to respond_to(:name) }

    it { is_expected.to respond_to(:description) }

    it { is_expected.to respond_to(:price) }

  end

  context '#keys' do
    it 'returns a list of public keys' do
      expect(dish.keys).to eq %w(name description price)
    end
  end

  context '#[]' do
    it 'should return a keys associated value' do
      expect(dish[:name]).to eq 'Test Dish 1'
    end
  end

  context '#[]=' do
    it 'should write a value to key' do
      dish[:name] = 'Test Dish Edited'
      expect(dish[:name]).to eq 'Test Dish Edited'
    end
  end
end
