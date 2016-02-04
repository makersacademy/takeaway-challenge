require 'customer'

describe Customer do

  let(:restaurant) {double :restaurant, find_order: 13}

  subject(:customer) {described_class.new("Rufus", "1-800-EXAMPLE")}


  context 'returning personal info' do
    describe '#name' do
      it 'returns customer name' do
        expect(customer.name).to eq "Rufus"
      end
    end

    describe '#name' do
      it 'returns customer tel no' do
        expect(customer.tel_no).to eq "1-800-EXAMPLE"
      end
    end
  end
end
