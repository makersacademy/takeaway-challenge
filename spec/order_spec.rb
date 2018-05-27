require "order"
require "restaurant"

describe Order do
  let(:order) { described_class.new }
  let(:current_order) {{ "Runny Risotto" => 2,
                    "Cold Pizza" => 3 }}

  it { is_expected.to respond_to(:select_dishes).with(1).argument }
  it { is_expected.to respond_to(:checking_total).with(1).argument }

  context "---placing the order---" do
    it "allows the customer to select some number of several dishes" do
      expect(order.select_dishes(current_order)).to eq current_order
    end

    it "raises an error if the selected dishes are not on the menu" do
      error_order = {"Wrong Dish" => 2}
      expect {order.select_dishes(error_order)}.to raise_error"Incorrect order - please select a dish from the menu"
    end

    it "raises an error if the given total doesn't match the sum of the various dishes" do
      order.select_dishes(current_order)
      error_given_total = 10
      expect {order.checking_total(error_given_total)}.to raise_error"Incorrect sum - please retry to place order"
    end
  end

  context "---finalizing the order if conditions are met---" do
    it "returns the time before the order must be delivered" do
           expect(order.delivery_time).to be_instance_of(String)
    end

    it "finalizes the order by sending a text to the custumer" do

    end
  end
end
