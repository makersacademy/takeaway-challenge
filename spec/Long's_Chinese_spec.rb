require "Long's_Chinese"

RSpec.describe Restaurant do
  let(:order) { double :order, empty?: false, complete: "Thank you, come again!" }
  let(:restaurant) { Restaurant.new(order) }

  describe "#submit_order" do
    it "should submit the order if the payment amount is correct" do
      allow(order).to receive(:correct?).and_return(true)
      expect(restaurant.submit_order(18)).to eq "Thank you, come again!"
    end

    it "should raise an error if the basket is empty" do
      allow(order).to receive(:empty?).and_return(true)
      expect { restaurant.submit_order(25) }.to raise_error "Your basket is empty"
    end

    it "should raise an error if the given amount does not match the order's total amount" do
      allow(order).to receive(:correct?).and_return(false)
      expect { restaurant.submit_order(25) }.to raise_error "Incorrect payment amount"
    end
  end
end