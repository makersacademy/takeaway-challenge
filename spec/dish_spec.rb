describe Dish do
  let(:pasta) { described_class.new('Pasta', 5) }

  describe '#initialize' do
    it 'is expected to initialize with a name' do
      expect(pasta.name).to eq 'Pasta'
    end

    it 'is expected to initialize with a price' do
      expect(pasta.price).to eq 5
    end
  end
end
