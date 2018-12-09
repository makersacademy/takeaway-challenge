require "order.rb"

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

describe Order do

  let(:order) { Order.new }
  let(:menu) { Menu.new }

  it 'should initialize with empty #list and total of 0' do
    expect(order.cart).to be_empty
  end

  it 'should add items, and accept quantity to the order' do
    expect { order.add(4, 5) }.to change { order.cart.count }.from(0).to(1)
  end

  it 'should accept number of items as second arg which defualts to 1' do
    expect { order.add(1) }.to change { order.cart.count }.from(0).to(1)
  end

end
