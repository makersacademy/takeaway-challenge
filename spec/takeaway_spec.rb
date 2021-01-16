require 'takeaway'
require 'order'

describe Takeaway do
  let(:order) { described_class.new }

  it 'shows the menu' do
    expect(subject.menu).to eq Takeaway::MENU
  end

  it 'instantiated a new order instance' do
    expect(subject.order).to be_instance_of Order
  end
end
