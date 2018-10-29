require 'menu'

describe Menu::Category do
  let(:category_name) { 'category_name' }
  let(:dish) { double :dish }
  subject { described_class.new(category_name) }

  describe '#name' do
    it 'has a name' do
      expect(subject.name).to eq category_name
    end
  end

  describe '#add_dish' do
    it 'adds a dish to items' do
      subject.add_dish(dish)
      expect(subject.items).to include(dish)
    end
  end

  describe '#items' do
    it 'returns items' do
      subject.add_dish(dish)
      expect(subject.items).to eq [dish]
    end
  end

end
