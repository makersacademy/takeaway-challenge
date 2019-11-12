require 'takeaway'

describe Takeaway do
  it { is_expected.to be_instance_of Takeaway }

  it "should contain a list of dishes with prices" do
    expect(subject.menu). to be_instance_of Hash
  end
end
