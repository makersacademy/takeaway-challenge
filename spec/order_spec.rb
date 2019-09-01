require './lib/order.rb'

describe Order do
  it 'stores the dish and quantity ordered' do
    subject.add("burger", 3, 6)
    expect(subject.current_order).to eq([{ dish: "burger", quantity: 3, cost: 6 }])
  end
  it 'can add dishes to the current order' do
    subject.add("burger", 3, 6)
    subject.add("chips", 2, 2)
    expect(subject.current_order).to eq([{ dish: "burger", quantity: 3, cost: 6 },
                                                { dish: "chips", quantity: 2, cost: 2 }])
  end
  it 'calculates a string with order so far' do
    subject.add("burger", 3, 6)
    subject.add("chips", 1, 1)
    expect(subject.show).to eq "burger x3 = £6, chips x1 = £1"
  end
  it 'calculate the total of the order' do
    subject.add("burger", 3, 6)
    subject.add("chips", 1, 1)
    expect(subject.total).to eq 7
  end
end
