require 'dish'

describe Dish do

  context 'on initialize' do
    let(:name) { double :name }
    let(:price) { double :price }
    subject(:dish) { described_class.new(name, price) }
    it 'Sets name of the dish to an initial name' do
      expect(subject.name).to eq name
    end
    it 'Sets price of the dish to an initial price' do
      expect(subject.price).to eq price
    end
  end
end
