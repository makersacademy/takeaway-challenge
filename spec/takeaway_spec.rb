require 'takeaway'
require 'order'

describe Takeaway do
  let(:order) { double :order}

  it 'shows the menu' do
    expect(subject.menu).to eq Takeaway::MENU
  end

  it 'instantiated a new order instance' do
    expect(subject.order).to be_instance_of Order
  end
end
