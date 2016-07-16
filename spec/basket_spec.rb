require 'basket'


describe Basket do

  let(:takeaway) {double(:takeaway)}

  describe '#total_price' do

    it 'has no total when instatiated' do
      expect(subject.total_price).to eq(0)
    end

  end

end
