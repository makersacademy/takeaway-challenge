require 'takeaway'

describe Takeaway do
  it 'has a menu to show to a customer' do
    expect(subject.menu).to be_an_instance_of Menu
  end
end
