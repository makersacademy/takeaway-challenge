require "takeaway"

describe Takeaway do
  it "allows you to see a list of dishes with prices" do
    expect(subject.view_menu).to eq subject.menu
  end

  it "allows you to create an order" do
    subject.create_order
    expect(subject.current_order).to be_an_instance_of(Order)
  end
end
