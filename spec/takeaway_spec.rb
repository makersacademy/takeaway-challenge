require 'takeaway'

describe Takeaway do
  it { is_expected.to be_instance_of Takeaway }

  it "should contain a list of dishes with prices" do
    expect(subject.menu).to be_instance_of Hash
  end

  it "should have a menu which is subdivided" do
    expect(subject.menu[:pizza]).to eq ({"Margherita" => 8.95, "Hawaiian" => 9.95, "Vegetarian" => 9.95, "Pepperoni" => 10.95, "BBQ Chicken" => 10.95})
  end

  it "should allow the user to place an order" do
    expect(subject).to respond_to(:order)
  end
end
