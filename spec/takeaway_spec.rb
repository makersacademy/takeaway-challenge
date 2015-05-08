require 'takeaway'

describe Takeaway do
  it "has a menu" do
    expect(subject.list_menu).not_to be_empty
  end

  it "can take orders" do
    subject.add_order_item :Fish, 1
    expect(subject.orders).to eq [{:Fish => 5}]
  end
end