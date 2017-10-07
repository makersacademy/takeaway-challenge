require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it { is_expected.to respond_to :menu }

  it 'is initialsed with a meals list' do
    expect(takeaway.menu).to be_empty
  end

end
