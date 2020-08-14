require 'takeaway'

describe Takeaway do
  it "should exist" do
    expect(subject).to be_instance_of Takeaway
  end
  it 'intialize with instance of menu accessible with .menu' do
    expect(subject.menu).to be_instance_of Menu
  end
end
