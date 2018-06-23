require 'basket'

describe Basket do
  subject(:basket) { described_class.new }

  let(:dishes) { [{ :dish => "Dosa", :amount => 3, :price => 7.95 }, { :dish => "Chapatti", :amount => 2, :price => 2.7 }] }

  before do
    basket.add('Dosa', 3, 7.95)
    basket.add('Chapatti', 2, 2.70)
  end

  describe '#add' do
    it 'saves selected dishes' do
      expect(subject.orders).to eq dishes
    end
  end
  describe '#show' do
    it 'returns the selected dishes and the sum of their prices' do
      expect(subject.show).to eq "3 x Dosa - £23.85\n2 x Chapatti - £5.40"
    end
  end
end
