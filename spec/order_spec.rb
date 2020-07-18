require 'order'

describe Order do
  it 'allows the customer to add item and quantity to an order' do
    expect(subject.add_to_order('mexican',2)).to eq 'mexican - Qty:2 added to order'
  end
  it 'allows the customer to display current items in basket' do
    subject.add_to_order('mexican',2)
    subject.add_to_order('meat feast',1)
    expect(subject.display_order).to eq 'Current order: mexican - Qty:2, meat feast - Qty:1'
  end
  it 'displays the total price of the current order' do
    subject.add_to_order('meat feast',1)
    expect(subject.display_total).to eq (5.99)
  end
end
