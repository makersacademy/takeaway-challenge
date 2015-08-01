require 'order'

describe Order do
  it 'allows customers to select a dish' do
  expect(subject).to respond_to(:choose_dish).with(1).argument
  end

  it 'checks that what has been selected is available on the menu' do
    new_order = Order.new
    expect{ new_order.choose_dish 'chicken and rice' }.to raise_error "This item is not availble on the menu"
  end

end