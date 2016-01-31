require 'order_dispatch'

describe OrderDispatch do
  subject(:dispatch)  { described_class.new(client_klass, order_klass) }
  let(:order_klass)   { double :order_klass, new: order }
  let(:client_klass)  { double :client_klass, new: client }
  let(:client)        { double :client }
  let(:order_details) { double :hash }
  let(:order)         { double :order, total: 20, summary: order_details }

  before do
    allow(client).to receive(:account)  { client }
    allow(client).to receive(:messages) { client }
    allow(client).to receive(:create)   { nil }
  end

  describe '#place_order' do
    after do
      dispatch.place_order(order_details, order.total)
    end

    it 'initializes a new order' do
      expect(order_klass).to receive(:new)
    end

    it 'sends text confirmation' do
      expect(client).to receive(:create)
    end
  end
end
