require 'confirmer'

describe Confirmer do
  let(:client) {double(:fake_client, messages: object)}
  subject(:confirmer) { described_class.new({ 'Beans' => 3, 'Broccoli' => 4 }) }

  it 'initializes with items' do
    expect(confirmer.items).not_to be nil
  end

  it 'has a #confirm_order method' do
    expect(confirmer).to respond_to :confirm_order
  end

  before do
    allow(confirmer).to receive(:confirm_order)
  end
  describe "#confirm_order" do
    it 'sends an order confirmation' do
      expect(confirmer).to receive(:confirm_order)
      confirmer.confirm_order
    end
  end

end
