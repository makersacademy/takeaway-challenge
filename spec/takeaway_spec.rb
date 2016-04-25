require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: nil)}

  let(:menu) { [{ dish: "Pollo", price: "10.00" }] }
  let(:order) { {"Pollo" => 2} }
  let(:sms) { double(:sms) }

  before do
    allow(order).to receive(:add)
    allow(order).to receive(:totals)
  end

  it { is_expected.to respond_to(:display).with(1).argument }

  describe "#place order" do
    it 'raises an error if dish not found' do
      wrong_order =  {"Beef" => 2}
      message = "No such dish on the menu"
      expect { takeaway.place_order(wrong_order) }.to raise_error message
    end
  #
  #   it 'can order some number of several dishes' do
  #     expect(order).to receive(:add)
  #     takeaway.place_order(order)
  #   end
  end
  #
  # it "sends a confirmation sms when the order has been placed" do
  #   takeaway.place_order(order)
  #   expect(sms).to receive(:send)
  # end
end
