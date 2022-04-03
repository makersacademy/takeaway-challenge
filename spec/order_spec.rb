require_relative '../lib/order'

describe Order do
  o1 = Order.new([{ :choice => 'Meatball sub', :price => 3.5, :portions => 2, :sub_total => 7.0 }, { :choice => 'Strawberry milkshake', :price => 2.5, :portions => 2, :sub_total => 5.0 }])
  o2 = Order.new('Some food')
  o3 = Order.new([{ :choice => 'Chicken korma', :price => 7.5, :portions => 1, :sub_total => 7.5 }, { :choice => 'Cheese naan', :price => 2.5, :portions => 3, :sub_total => 7.5 }])
  o4 = Order.new([{ :choice => 'Large margherita', :price => 12.5, :portions => 1, :sub_total => 12.5 }])
  it 'returns an itemised bill with a total price' do
    expect(o1.show_bill). to eq ['2 x Meatball sub: £7.00', '2 x Strawberry milkshake: £5.00', 'Total: £12.00']
  end

  it 'raises an error when trying to pay before showing bill (and updating total)' do
    expect { o2.pay(0) }.to raise_error('Please calculate the bill first')
  end

  it 'raises an error when the paid amount is less than the total' do
    o3.show_bill
    expect { o3.pay(13) }.to raise_error('That was not enough, please try to pay again')
  end

  it 'returns a confirmation message when the paid amount is greater than or equal' do
    o4.show_bill
    expect(o4.pay(13)).to eq 'Thank you, your confirmation text is on the way'
  end
end
