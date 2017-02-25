require 'dish'

describe Dish do

  let(:name) {"Chow mein"}
  let(:price) {5}
  subject(:dish) {described_class.new(name, price)}

  describe '#name' do
    it 'should return a name' do
      expect(dish.name).to eq name
    end
  end

  describe '#price' do
    it 'should return a price' do
      expect(dish.price).to eq price
    end
  end

end
