require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}

  it 'responds to menu' do
    expect(takeaway).to respond_to(:menu)
  end
end
