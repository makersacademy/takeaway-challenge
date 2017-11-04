require 'dish'
describe Dish do
  subject(:dish) { described_class.new(name, price, allergy_info) }
  let(:name) { "spring rolls" }
  let(:price) { 3.99 }
  let(:allergy_info) { "No specifications regarding allergies" }
  describe '#name' do
    context 'name of the dish'
    it 'returns name' do
      # dish = Dish.new("spring rolls")
      expect(dish.name).to eq 'spring rolls'
    end
  end
  describe '#price' do
    context 'price of the dish'
    it 'returns price' do
      expect(dish.price).to eq 3.99
    end
  end
  describe '#dish_info' do
    it 'should show me the dishes price and name in a hash' do
      expect(dish.dish_info).to eq({ "spring rolls" => 3.99 })
    end
  end
  describe '#allergy_info' do
    it 'should return allergy info' do
      expect(dish.allergy_info).to eq "No specifications regarding allergies"
    end
  end
end
