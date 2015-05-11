require 'order'
require 'takeaway'

describe Order do

  it "should have an empty container of items" do
    expect(subject.orders).to eq []
  end

  it "should have a status of not delivered" do
    expect(subject.delivered).to be_falsey
  end

  it {is_expected.to respond_to (:order_calculation)}

  it "should have a status of delivered when order sent" do
    subject.order_sent
    expect(subject.delivered).to be_truthy
  end
end