require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  it 'has a menu' do
    expect(takeaway.menu).to be_a Menu
  end

  it 'is created with no orders' do
    expect(takeaway.orders).to be_empty
  end

end
