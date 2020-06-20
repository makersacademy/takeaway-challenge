require 'takeaway'

describe Takeaway do
  it 'can show the menu to a customer' do
    expect(subject.menu).to be_an_instance_of Menu
  end
end
