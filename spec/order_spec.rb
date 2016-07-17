require 'order'
describe Order do
  subject(:order) { described_class.new }
  let(:naan) { double :naan }

  it 'adds order to the basket' do
    order.add(naan, 2)
    expect(order.basket).to include naan
  end

end
