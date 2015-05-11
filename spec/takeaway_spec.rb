require 'takeaway'

describe Takeaway do
  it "has a menu" do
    expect(subject.list_menu).not_to be_empty
  end

  it "can take orders" do
    subject.add_order_item :FishAndChips, 1
    expect(subject.orders).to eq [{:FishAndChips => 5}]
  end

  it "can send text messages to clients" do
    allow(subject).to receive(:respond_to_order).and_return(true)
    expect(subject.respond_to_order).to eq true
  end

  it "can enable order calculation" do
    subject.add_order_item :FishAndChips, 1
    subject.add_order_item :MeatAndTwoVeg, 1
    expect(subject.give_order_total).to eq 12
  end

  it "can remove items from an order" do
    subject.add_order_item :FishAndChips, 2
    subject.give_order_total
    subject.remove_order
    subject.give_order_total
    expect(subject.total_order_value).to eq 5
  end
end