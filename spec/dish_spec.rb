require 'dish'

describe Dish do
  let(:test_name) { 'Everything' }
  let(:test_price) { 42 }
  subject(:dish) { described_class.new( {name: test_name, price: test_price }) }
  describe '#name' do

    it 'expected to return dish name' do
      expect(dish.name).to eq test_name
    end

    it 'expected to return dish price' do
      expect(dish.price).to eq test_price
    end
  end
end
