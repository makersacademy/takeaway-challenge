require 'dish'
describe Dish do
  let(:name) { (0...8).map { (65 + rand(26)).chr }.join }
  subject(:dish) { described_class.new(name) }

  describe '#name' do
    it 'returns the name' do
      expect(dish.name).to eq name
    end
  end
end
