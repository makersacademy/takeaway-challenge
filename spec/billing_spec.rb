require 'billing'

describe Billing do
  let(:order) do [
                    { name: 'Pizza', price: 8, quantity: 3 },
                    { name: 'Donner Wrap', price: 6, quantity: 2 },
                    { name: 'Nuggets', price: 3, quantity: 5 }
                  ]
  end

  describe "checking totals" do

    describe "#sum" do
      it 'gets sum of order, should be 51' do
        expect(subject.sum(order)).to eq 51
      end
    end

    describe "#check_sum" do
      it 'raises error if sum does not match up with check sum' do
        expect { subject.check_sum(order, 32) }.to raise_error "Sum is not correct!"
      end

      it 'returns true when total matches up with check_sum' do
        expect(subject.check_sum(order)).to eq true
      end
    end
    
  end
  
end
