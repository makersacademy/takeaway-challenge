require "order"

describe Order do

  it "starts with empty array" do
    expect(subject.order).to eq []
  end

  it "adds dish to the order" do
    expect { subject.add("Breakfast") }.to change { subject.order.count }.by(1)
  end
end
