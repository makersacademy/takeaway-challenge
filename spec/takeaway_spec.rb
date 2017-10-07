require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it 'is initialsed with a meals list' do
    expect(takeaway.menu).to be_empty
  end

end
