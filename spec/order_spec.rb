require 'order'

RSpec.describe Order do
  subject(:order) { described_class.new(menu, order_sms) }
  let(:order_spec) { { "Classic Chicken": 2 } }
  let(:dishes) { { "Classic Chicken": 8.85 } }
  let(:menu) { double :menu, dishes: dishes }

  let(:order_sms) { double :order_sms, send: 'Your order will be with you soon!' }

  it 'accepts an order' do
    expect(order.add(order_spec)).to eq 'Added to Basket'
  end

  it 'stores the order' do
    order.add(order_spec)
    expect(order.items).to eq order_spec
  end

  it 'returns the sum of the order' do
    order.add(order_spec)
    allow(menu).to receive(:[]).and_return(8.85)
    expect(order.total).to eq 17.7
  end

  it 'sends an order confirmation text' do
    expect(order.checkout).to eq 'Your order will be with you soon!'
  end
end
