require 'dish'
describe Dish do
  subject(:dish) { described_class.new(name, price) }
  describe '#name' do
    context 'name of the dish'
    let(:name) { "spring rolls" }
    let(:price) { 3.99 }
    it 'returns name' do
      # dish = Dish.new("spring rolls")
      expect(dish.name).to eq 'spring rolls'
    end
  end
  describe '#price' do
    context 'price of the dish'
    let(:name) { "spring rolls" }
    let(:price) { 3.99 }
    it 'returns price' do
      expect(dish.price).to eq 3.99
    end
  end
  describe '#dish_info' do
  let(:name) { "spring rolls" }
  let(:price) { 3.99 }
  it 'should show me the dishes price and name in a hash' do
    expect(dish.dish_info).to eq ({"spring rolls" => 3.99})
  end
  end
end
