require 'order'

describe Order do

  subject(:order) {Order.new}

  it 'creates an instance of the order class' do
    expect(order).to be_instance_of(Order)
  end

end