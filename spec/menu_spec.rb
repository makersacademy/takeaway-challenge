require 'menu'

describe Menu do
  let(:dish) { double :dish, name: 'dish' }
  let(:category) { double :category, items: [dish] }
  let(:categories) { [category] }
  subject { described_class.new(categories) }

  describe '#categories' do
    it "returns the list of categories'" do
      expect(subject.categories).to eq categories
    end
  end

  describe '#find_item_by_name' do
    it 'find items by name, returns object' do
      expect(subject.find_item_by_name('dish')).to eq dish
    end
  end
end
