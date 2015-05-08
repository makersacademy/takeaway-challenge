require 'takeaway'

describe Takeaway do
  it "has a menu" do
    expect(subject.list_menu).not_to be_empty
  end

  it "can take orders" do
    subject.add_order_item :Fish, 1
    expect(subject.orders).to eq [{:Fish => 5}]
  end

  xit "can send text messages to clients" do
    #will need to use stubs
    expect(subject.respond_to_order).to eq "Thank you! Your order was placed and will be delivered before (insert Time function)"
  end

  it "can enable order calculation" do #possible module
    subject.add_order_item :Fish, 1
    subject.add_order_item :Meat, 1
    expect(subject.give_order_total).to eq 12
  end
end