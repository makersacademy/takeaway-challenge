require 'order_dispatch'

describe OrderDispatch do
  subject(:dispatch)  { described_class.new(client_klass) }
  let(:client_klass)  { double :client_klass, new: client }
  let(:client)        { double :client }
  let(:order)         { double :order }

  describe '#new_order' do
    it { is_expected.to respond_to(:new_order).with(1).argument }

    before do
      allow(client).to receive(:account)  { client }
      allow(client).to receive(:messages) { client }
      allow(client).to receive(:create)   { nil }
    end

    it 'sends text confirmation' do
      expect(client).to receive(:create)
      dispatch.new_order(order)
    end
  end
end
