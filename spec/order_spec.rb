require "order.rb"

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

describe Order do

  let(:order) { Order.new }

  it 'should initialize with empty #list and total of 0' do
    expect(order.list).to be_empty
  end

end
