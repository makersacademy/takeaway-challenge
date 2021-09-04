require 'order'

describe Order do
  let(:dish) { Dish.new("Pad Thai", 5) }

  it 'starts with an empty order list' do
    expect(subject.order_list).to be_empty
  end

  it 'can add dishes to the order list' do
    subject.add("Pad Thai", 1)
    expect(subject.order_list.last.name).to eq("Pad Thai")
  end

  it 'can add several dishes at once' do
    expect { subject.add("Red Curry", 3) }.to change { subject.order_list.count }.by(3)
  end

  it 'can return the total price of the order' do
    subject.add("Red Curry", 1)
    subject.add("Pad Thai", 2)
    expect(subject.total).to eq(16)
  end
end
