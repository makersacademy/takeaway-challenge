require 'order'

describe Order do
  let(:order) { Order.new('Stephen Dawes', 123456) }

  it 'should have a name' do
    expect(order.name).to eq('Stephen Dawes')
  end

  it 'should have a number' do
    expect(order.number).to eq(123456)
  end


end
