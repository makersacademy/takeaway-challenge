require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new }

  it 'allows customers to view the menu' do
    expect { takeaway.menu }.not_to raise_error
  end

  it 'allows a customer to add an item to an order' do
    expect { takeaway.add_to_order }.not_to raise_error
  end
end
