require 'order'

describe Order do
  it 'allows the customer to add item and quantity to an order' do
    expect(subject.add_to_order('mexican', 2)).to eq '2x mexican added to order. Subtotal £9.98'
  end
  it 'raised an error if an item is incorrectly entered' do
    expect { subject.add_to_order('chips', 1) }.to raise_error 'Item does not exist'
  end

  it 'allows the customer to display current items in basket' do
    subject.add_to_order('mexican', 2)
    subject.add_to_order('meat feast', 1)
    expect(subject.display_order).to eq 'Current order: 2x mexican, 1x meat feast'
  end

  it 'raises an error if the customer tries to display an empty basket' do
    expect { subject.display_order }.to raise_error 'Basket empty'
  end

  it 'displays the total price of the current order' do
    subject.add_to_order('meat feast', 1)
    expect(subject.display_total).to eq("Order total: £5.99")
  end

  it 'raises an error if the customer tries to display the price of an empty basket' do
    expect { subject.display_total }.to raise_error 'Basket empty'
  end

  it 'displays a confirmation message when the order is sent' do
    time = (Time.now + 1 * 60 * 60).strftime("%I:%M %p")
    subject.add_to_order('meat feast', 1)
    expect(subject.place_order).to eq "Thank you for ordering from Ralph's Pizza! Your food will be delivered before #{time}"
  end

  it 'raises an error if the customer tries to place order with an empty basket' do
    expect { subject.place_order }.to raise_error 'Basket empty'
  end

end
