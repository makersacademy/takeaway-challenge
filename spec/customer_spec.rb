require 'customer'

describe Customer do

  subject(:customer) { described_class.new('name', 'number') }
  let(:order) { double(:order) }

  describe '#place_order' do

    before(:each) do
      customer.begin_order(order)
      allow(order).to receive(:order_total).and_return(10)
    end

    it 'raises an error if payment does not equal order total' do
      message = 'Payment does not match order total!'
      expect{customer.place_order(20)}.to raise_error message
    end

    context 'when payment correct' do

      before(:each) do
        customer.place_order(10)
      end

      it 'save the current order in order history' do
        expect(customer.order_history).to include order
      end

      it 'reset current order to nil' do
        expect(customer.current_order).to be_nil
      end

    end

  end

end