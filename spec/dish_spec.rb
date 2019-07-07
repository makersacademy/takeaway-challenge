require 'dish'
describe Dish do
  subject(:dish) { described_class.new("Green Curry", 5) }

  describe '#name' do
    it 'should have a name' do
      expect(dish.name).to eq "Green Curry"
    end
  end

  describe '#price' do
    it 'should have a price' do
      expect(dish.price).to eq 5
    end
  end

end
