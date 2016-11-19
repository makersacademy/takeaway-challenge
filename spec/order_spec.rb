require 'order'

describe Order do

subject(:order) { described_class.new}

  it {is_expected.to respond_to :list_of_dishes}

  it 'should respond with a hash' do
    order = Order.new
    expect(order.list_of_dishes).to include( :pizza => 9 )
  end

end
