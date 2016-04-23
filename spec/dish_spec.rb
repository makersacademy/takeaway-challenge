require 'dish'
describe Dish do
  let(:name) { (0...8).map { (65 + rand(26)).chr }.join }
  let(:new_name) { (0...8).map { (65 + rand(26)).chr }.join }
  let(:price) { rand(10) }
  let(:new_price) { rand(10) }
  subject(:dish) { described_class.new(name, price) }

  describe '#initialize' do
    subject(:dish_class) { described_class }
    it 'is initialized with two arguments' do
      expect(dish_class.new(name, price)).to be_a dish_class
    end
    it 'errors if no argument is given' do
      expect{ dish_class.new }.to raise_error(ArgumentError)
    end
    it 'errors if one argument is given' do
      expect{ dish_class.new(name) }.to raise_error(ArgumentError)
    end
  end

  describe '#name' do
    it 'returns the name' do
      expect(dish.name).to eq name
    end
  end

  describe '#name=' do
    it 'updates the name' do
      dish.name = new_name
      expect(dish.name).to eq new_name
    end
  end

  describe '#price' do
    it 'returns the price' do
      expect(dish.price).to eq price
    end
  end

  describe '#price=' do
    it 'updates the price' do
      dish.price = new_price
      expect(dish.price).to eq new_price
    end
  end
end
