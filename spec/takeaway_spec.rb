require 'takeaway'

describe Takeaway do

  it 'initializes with a menu' do
    expect(subject.menu).not_to be_empty
  end

end
