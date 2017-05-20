require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it 'should open a new order' do
    expect(takeaway).to respond_to(:order)
  end
end
