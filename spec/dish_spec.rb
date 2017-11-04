require 'dish'
describe Dish do
  subject(:dish) { described_class.new(name) }
  describe '#name' do
    context 'name of the dish'
    let(:name) { "spring rolls" }
    it 'returns name' do
      # dish = Dish.new("spring rolls")
      expect(dish.name).to eq 'spring rolls'
    end
  end
end
