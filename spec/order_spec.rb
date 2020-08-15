require 'order'

describe Order do

  it 'returns menu item from dishes hash' do
    menu = double("menu")
    allow(menu).to receive(:dishes) { "Shepards Pie" }
  end

  it 'customer order is empty before customer input' do
    expect(subject.customer_order).to eq({})
  end

  it 'customers order and quantity is added to a hash' do
    subject.customer_selection("Shepards pie", 2)
    expect(subject.customer_order.count).to eq(1)
  end

end
