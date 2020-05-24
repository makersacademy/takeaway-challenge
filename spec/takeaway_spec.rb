require 'takeaway'
require 'menu'
require 'order'

describe Takeaway do

  let(:order) { Order.new }

  it 'creates a new instance of takeaway' do
    expect(subject).to be_instance_of Takeaway
  end

  it 'responds to the class Takeaway' do
    expect(subject).to respond_to(:view_menu)
  end

describe '#add_item' do

  it 'allows user to add items' do
    expect(subject.add_item("item", 2)).to eq(order.add_to_order("item", 2))
  end
end
end
