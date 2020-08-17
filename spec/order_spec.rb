require 'order'

describe Order do

it {is_expected.to respond_to(:sum).with(1).argument}

  describe '#sum' do
    it 'returns a sum of cost of items recieved' do
      expect(subject.sum([{:Burger => 5.00}, {:Burger => 5.00}, {:Fish => 6.00}])).to eq 16
    end
  end

end