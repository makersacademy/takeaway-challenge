require 'menu'

describe Menu do

  describe '#categories' do
    let(:category) { double :category }
    let(:categories) { [category] }
    subject { described_class.new(categories) }

    it "returns the list of categories'" do
      expect(subject.categories).to eq categories.dup
    end
  end
end
