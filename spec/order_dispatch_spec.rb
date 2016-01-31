require 'order_dispatch'

describe OrderDispatch do
  subject(:dispatch)  { described_class.new(client, order_klass) }
  let(:order_klass)   { double :order_klass, new: order }
  let(:client)        { double :client }
  let(:order)         { double :order }

  before do
    allow(client).to receive(:account)  { client }
    allow(client).to receive(:messages) { client }
    allow(client).to receive(:create)   { nil }
  end

  describe '#initialize' do
    it 'initializes with an empty order history' do
      expect(dispatch.order_history).to be_empty
    end
  end

  describe '#place_order' do
    let(:order_details) { double :hash }
    after do
      dispatch.place_order(order_details)
    end

    it 'initializes a new order' do
      expect(order_klass).to receive(:new)
    end

    it 'sends text confirmation' do
      expect(client).to receive(:create)
    end
  end

  describe '#order_history' do
    it 'returns a list of previous orders' do
      dispatch.place_order(order)
      expect(dispatch.order_history).to include order
    end
  end
end
