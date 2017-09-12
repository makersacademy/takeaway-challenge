require 'order'
describe Order do
  let(:order) { described_class.new }

  it 'should have empty basket at the start' do
    expect(order.basket).to eq ({})
  end
  it 'should respond to add method' do
    expect(order).to respond_to(:add).with(2).arguments
  end
  it 'should display updated basket' do
    order.add('pizza',2)
    expect(order.basket).to eq({'pizza'=>2})
  end

end
