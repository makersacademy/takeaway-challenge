require 'order'
require 'text'

describe Order do

  it 'returns menu item from dishes hash' do
    menu = double("menu")
    allow(menu).to receive(:dishes) { "Shepards Pie" }
  end

  it 'customer order is empty before customer input' do
    expect(subject.customer_order).to eq({})
  end

end
