require 'takeaway_kitchen'

describe TakeawayKitchen do

  it 'has a menu' do
    expect(subject.menu).not_to be_empty
  end
end
