require 'user'

describe User do
  let(:user){ User.new }
  let(:restaurant){double :restaurant}

  it 'should have nothing in their order to start with' do
    expect(user.line_items).to eq []
  end

  it 'can add an item to an order' do
    user.add_to_order(:pasta)
    expect(user.line_items).to eq [:pasta]
  end

  it 'can add multiples of an item to an order' do
    user.add_to_order(:sandwich, 2)
    expect(user.line_items).to eq [:sandwich, :sandwich]
  end

  it 'can place an order to a takeaway' do
    user.add_to_order(:sandwich)
    user.add_to_order(:pasta)
    expect(restaurant).to receive(:check_order).with([:sandwich, :pasta], 11)
    user.order_from(restaurant, 11)
  end

end
