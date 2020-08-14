require 'takeaway'

describe Takeaway do
  it "should exist" do
    expect(subject).to be_instance_of Takeaway
  end
  it 'intializes with instance of menu accessible with .menu' do
    expect(subject.menu).to be_instance_of Menu
  end
  it 'intializes with instance of order accessible with .order' do
    expect(subject.order).to be_instance_of Order
  end

end
