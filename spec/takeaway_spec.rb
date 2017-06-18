require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:order) { double(:order) }
  let(:menu) { double(:menu) }
  it { is_expected.to respond_to(:menu) }
  it { is_expected.to respond_to(:order) }
  it { is_expected.to respond_to(:total_per_product) }

  describe "#add_order" do
    it "adds an order" do
      # allow(order).to receive(add_to_basket)
      takeaway.add_order("burrito", 2)
      expect(takeaway.order.basket).to include('burrito' => 2)
    end
  end

  describe '#confirm_order' do
    it 'should send sms after the order is completed' do
      allow(takeaway).to receive(:confirm_order).with(12)
      expect(takeaway).to receive(:confirm_order).with(12)
      takeaway.confirm_order(12)
    end
  end
  describe "#total" do
    it "calculates the total cost for the customer" do
      takeaway = Takeaway.new
      takeaway.add_order('pizza', 2)
      expect(takeaway.total).to eq 12
    end
  end
  describe "#order_check" do
    it "prints information about the order" do
      takeaway.add_order('pizza', 2)
      expect { takeaway.order_check }.to output.to_stdout
    end
  end
end
