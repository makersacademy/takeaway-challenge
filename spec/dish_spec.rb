describe Dish do
  subject { described_class.new('Pasta', 5) }

  describe '#initialize' do
    it 'is expected to initialize with a name' do
      expect(subject.name).to eq 'Pasta'
    end

    it 'is expected to initialize with a price' do
      expect(subject.price).to eq 5
    end
  end
end
