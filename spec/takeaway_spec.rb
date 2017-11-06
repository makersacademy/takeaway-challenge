require 'takeaway'

describe TakeAway do

let(:dish1) { subject.menu[0] }
let(:dish2) { subject.menu[1] }
let(:dish3) { subject.menu[2] }

  it 'should return a list of dishes with prices' do
    expect(subject.menu.length).to be > 0
  end
  it 'first dish should return price £7.99' do
    expect(dish1[1]).to eq 7.99
  end
  it 'adds dishes to order' do
    subject.add_to_order(dish2)
    subject.add_to_order(dish3)
    expect(subject.order.length).to eq 2
  end
  it 'checks prices of dishes to see if it matches total' do
    subject.add_to_order(dish1)
    subject.add_to_order(dish2)
    expect(subject.order_checkout).to eq dish1[1] + dish2[1]
  end
  it 'should send text message to confirm order' do
    subject.add_to_order(dish1)
    subject.add_to_order(dish3)
    expect(subject.confirm_order).to eq "Thank you! Your order was placed and will be delivered within 1 hour"
  end
end
