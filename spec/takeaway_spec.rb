require 'takeaway'

describe Takeaway do
subject(:takeaway) { described_class.new }

before do
  allow(takeaway).to receive(:send_text)
end

describe "#confirmed_order" do

    it 'sends a payment confirmation text message' do
      expect(takeaway).to receive(:send_text).with("Thank you for your order")
      takeaway.order.place_order("Chicken", 2)
      takeaway.complete_order(10)
    end
  end
end