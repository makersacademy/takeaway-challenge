require "order"
require "restaurant"

describe Order do
  let(:order) { described_class.new }
  let(:current_order) {{ "Runny Risotto" => 2,
                    "Cold Pizza" => 3 }}

  it { is_expected.to respond_to(:select_dishes).with(1).argument }
  it { is_expected.to respond_to(:check_sum?).with(1).argument }

  it "allows the customer to select some number of several dishes" do
    expect(order.select_dishes(current_order)).to eq current_order
  end

  it "checks if the selected dishes are included in the menu" do
    order.select_dishes(current_order)
    menu = Restaurant.new.dish
    expect(current_order.keys - menu.keys).to eq []
  end

  it "allows the custumer to check if the given total matches the sum of the various dishes" do
    order.select_dishes(current_order)
    given_total = 2 * 5 + 3 * 7
    expect(order.check_sum?(given_total)).to be true
  end
end
